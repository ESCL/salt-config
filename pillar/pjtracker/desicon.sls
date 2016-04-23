app:
  name: pjtracker
  settings: 'tracker.settings.prod'
  root: apps/pjtracker
  static_root: apps/pjtracker/static

  repository:
    url: 'git@github.com:ESCL/pjtracker.git'
    checkout: true

  ports:
    upstream: 8000
    downstream: 80

  secure: true

db:
  host: 'pjtracker0.c8hyiihqnbry.us-east-1.rds.amazonaws.com'
  port: 5432
  name: 'pjtracker'
  user: 'pjtracker'
  pass: 'tr4ckmypjs'
