AUTHENTICATION_SOURCES = ['internal']
OAUTH2_AUTO_CREATE_USER = True
MASTER_PASSWORD_REQUIRED = False
OAUTH2_CONFIG = [{
    'OAUTH2_NAME' : 'authentik',
    'OAUTH2_DISPLAY_NAME' : 'Skylab SSO',
    'OAUTH2_CLIENT_ID' : '${PGADMIN_OAUTH_CLIENT_ID}',
    'OAUTH2_CLIENT_SECRET' : '${PGADMIN_OAUTH_SECRET}',
    'OAUTH2_TOKEN_URL' : 'https://id.${SECRET_DOMAIN}/application/o/token/',
    'OAUTH2_AUTHORIZATION_URL' : 'https://id.${SECRET_DOMAIN}/application/o/authorize/',
    'OAUTH2_API_BASE_URL' : 'https://id.${SECRET_DOMAIN}/',
    'OAUTH2_USERINFO_ENDPOINT' : 'https://id.${SECRET_DOMAIN}/application/o/userinfo/',
    'OAUTH2_SERVER_METADATA_URL' : 'https://id.${SECRET_DOMAIN}/application/o/pgadmin/.well-known/openid-configuration',
    'OAUTH2_SCOPE' : 'openid email profile',
    'OAUTH2_ICON' : 'fa-openid',
    'OAUTH2_BUTTON_COLOR' : '#2db1fd'
}]