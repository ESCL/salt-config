base:
  'G@env:dev':
    - match: compound
    - auth.dev

  'G@env:dev and G@app:pjtracker':
    - match: compound
    - pjtracker.dev

  'G@env:demo':
    - match: compound
    - auth.demo

  'G@env:demo and G@app:pjtracker':
    - match: compound
    - pjtracker.demo
