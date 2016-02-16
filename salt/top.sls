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
    - services.nginx
    - pjtracker.service
