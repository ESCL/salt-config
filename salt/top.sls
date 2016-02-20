base:
  # Python main packages, always used
  '*':
    - core.python

  # Swap file (not used for dev)
  'not G@env:dev':
    - match: compound
    - core.swap

  # pjtracker app boxes, nginx and app service
  'G@app:pjtracker':
    - match: compound
    - pjtracker.service
    - services.nginx

  'G@roles:ci':
    - match: compound
    - services.jenkins
    - services.sonarqube.scanner

  'G@roles:qua':
    - match: compound
    - services.sonarqube.server