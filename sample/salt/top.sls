
base:
  'G@env:dev':
    - match: compound
    - apps.dev

  'G@roles:webserver':
    - match: compound
    - services.nginx
