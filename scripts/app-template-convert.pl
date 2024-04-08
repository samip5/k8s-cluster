use strict;
use warnings;

use feature qw(say);

use YAML::XS qw(LoadFile Dump DumpFile);

my $h = LoadFile($ARGV[0]);
my $name = $h->{metadata}{name};

my $o = $h->{spec}{values};

$o->{defaultPodOptions}{securityContext} = delete $o->{podSecurityContext} if $o->{podSecurityContext};
$o->{defaultPodOptions}{nodeSelector}= delete $o->{nodeSelector} if $o->{nodeSelector};

$o->{controllers}{$name}{containers}{app}{image} = delete $o->{image};
$o->{controllers}{$name}{containers}{app}{args} = delete $o->{args} if $o->{args};
$o->{controllers}{$name}{containers}{app}{command} = delete $o->{command} if $o->{command};
$o->{controllers}{$name}{containers}{app}{env} = delete $o->{env} if $o->{env};
$o->{controllers}{$name}{containers}{app}{resources} = delete $o->{resources} if $o->{resources};

$o->{ingress}{main}{className} = delete $o->{ingress}{main}{ingressClassName} if $o->{ingress}{main}{ingressClassName};
delete $o->{ingress}{main}{enabled};

my $hosts = $o->{ingress}{main}{hosts};
for my $host (@$hosts) {
  $host->{paths}->[0]->{service}{identifier} = 'app';
  $host->{paths}->[0]->{service}{port} = 'http';
}

my $persistence = $o->{persistence} || {};
for (keys %$persistence) {
  delete $o->{persistence}{$_}{enabled};
  if ($o->{persistence}{$_}{mountPath}) {
    $o->{persistence}{$_}{globalMounts} = [ { path => delete $o->{persistence}{$_}{mountPath} }];
    if ($o->{persistence}{$_}{subPath}) {
      $o->{persistence}{$_}{globalMounts}->[0]->{subPath} = delete $o->{persistence}{$_}{subPath};
    }
  }
}


$o->{controllers}{$name}{containers}{app}{probes} = delete $o->{probes} if $o->{probes};

if ($o->{volumeClaimTemplates}) {
  $o->{controllers}{$name}{type} = 'statefulset';
  $o->{controllers}{$name}{statefulset}{podManagementPolicy} = 'Parallel';
  $o->{controllers}{$name}{statefulset}{volumeClaimTemplates} = delete $o->{volumeClaimTemplates};
  my $vc = $o->{controllers}{$name}{statefulset}{volumeClaimTemplates};
  $vc->[0]->{globalMounts} = [
    { path => delete $vc->[0]->{mountPath} }
  ];
}

if (delete $o->{hostNetwork}) {
  $o->{defaultPodOptions}{hostNetwork} = builtin::true;
}

$h->{spec}{chart}{spec}{version} = '3.0.4';


$o->{controllers}{$name}{containers}{app}{securityContext} = delete $o->{securityContext} if $o->{securityContext};
if ($h->{metadata}{annotations}{'patch.sko.ai/app-security'}) {
  $o->{controllers}{$name}{containers}{app}{securityContext} = {
    allowPrivilegeEscalation => builtin::false,
    readOnlyRootFilesystem => builtin::true,
    capabilities => {
      drop => ["ALL"],
    }
    #add => ["NET_BIND_SERVICE"]
  };

  $o->{defaultPodOptions}{securityContext} = {
      runAsNonRoot => builtin::true,
      runAsUser => 568,
      runAsGroup => 568,
      fsGroup => 568,
      seccompProfile => {
        type => 'RuntimeDefault'
      }
  };
}

delete $h->{metadata}{annotations};


$o->{controllers}{$name}{containers}{app}{probes} = {
  liveness => { enabled => builtin::true },
  readiness => { enabled => builtin::true },
};

$o->{ingress}{app} = delete $o->{ingress}{main};
$o->{service}{app} = delete $o->{service}{main};
$o->{service}{app}{controller} = $name;

if ($ARGV[1] eq 'write') {
  DumpFile($ARGV[0], $h);
} else {
  print Dump $h;
}
