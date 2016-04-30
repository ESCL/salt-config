base:
  # Python main packages, always used
  '*':
    - core.python

  # Swap file (only for ec2 machines)
  'G@box_type:ec2':
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

  'G@roles:mail':
    - match: compound
    - services.postfix
