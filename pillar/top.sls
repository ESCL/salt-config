base:
  'G@box_type:vagrant':
    - match: compound
    - auth.vagrant

  'G@box_type:ec2':
    - match: compound
    - auth.ec2

  'G@env:dev and G@app:pjtracker':
    - match: compound
    - pjtracker.dev

  'G@env:demo and G@app:pjtracker':
    - match: compound
    - pjtracker.demo
