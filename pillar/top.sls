base:
  'G@box_type:vagrant':
    - match: compound
    - auth.vagrant

  'G@box_type:ec2':
    - match: compound
    - auth.ec2

  'G@roles:qua or G@roles:ci':
    - match: compound
    - sonar

  'G@env:dev and G@app:pjtracker':
    - match: compound
    - pjtracker.dev

  'G@env:demo and G@app:pjtracker':
    - match: compound
    - pjtracker.demo
