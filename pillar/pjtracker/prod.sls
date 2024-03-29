# Production environment

app:
  name: pjtracker
  settings: 'tracker.settings.prod'
  root: apps/pjtracker
  static_root: apps/pjtracker/static

  repository:
    url: 'git@github.com:ESCL/pjtracker.git'
    branch: master
    checkout: true

  ports:
    upstream: 8000
    downstream: 80

  secure: true

db: {}
