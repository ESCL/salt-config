base:
  # Authentication data

  'G@box_type:vagrant':
    - match: compound
    - auth.vagrant

  'G@box_type:ec2':
    - match: compound
    - auth.ec2

  # SonarQube data

  'G@roles:qua or G@roles:ci':
    - match: compound
    - sonar

  # Application environment settings

  'G@app:pjtracker and G@env:dev':
    - match: compound
    - pjtracker.dev

  'G@app:pjtracker and G@env:qa':
    - match: compound
    - pjtracker.qa

  'G@app:pjtracker and G@env:prod':
    - match: compound
    - pjtracker.prod

  # Application sub-environment (cluster) settings

  'G@app:pjtracker and G@sub_env:shared':
    - match: compound
    - pjtracker.shared

  'G@app:pjtracker and G@sub_env:desicon':
    - match: compound
    - pjtracker.desicon
