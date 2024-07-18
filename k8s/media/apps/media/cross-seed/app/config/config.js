module.exports = {
    delay: 20,
    qbittorrentUrl: "http://qbittorrent.media.svc.cluster.local",
    torznab: [
      "https://prowlarr.skylab.fi/19/api?apikey={{ .PROWLARR__API_KEY }}", // ant
      "https://prowlarr.skylab.fi/18/api?apikey={{ .PROWLARR__API_KEY }}", // st
      "https://prowlarr.skylab.fi/17/api?apikey={{ .PROWLARR__API_KEY }}", // phd
      "https://prowlarr.skylab.fi/16/api?apikey={{ .PROWLARR__API_KEY }}", // hdt
      "https://prowlarr.skylab.fi/15/api?apikey={{ .PROWLARR__API_KEY }}", // fl
      "https://prowlarr.skylab.fi/2/api?apikey={{ .PROWLARR__API_KEY }}", // ipt
    ],
    action: "inject",
    includeEpisodes: true,
    includeNonVideos: true,
    duplicateCategories: true,
    matchMode: "safe",
    skipRecheck: true,
    linkType: "hardlink",
    linkDir: "/var/mnt/merged/Downloads/qbittorrent/complete/cross-seed",
    dataDirs: [
        "/var/mnt/merged/Downloads/qbittorrent/complete/prowlarr",
        "/var/mnt/merged/Downloads/qbittorrent/complete/radarr",
        "/var/mnt/merged/Downloads/qbittorrent/complete/sonarr",
    ],
    outputDir: "/config/xseeds",
    torrentDir: "/config/qBittorrent/BT_backup",
};
