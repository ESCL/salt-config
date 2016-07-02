# QA environment (pre-production, demo)

app:
  name: pjtracker
  settings: 'tracker.settings.qa'
  root: apps/pjtracker
  static_root: apps/pjtracker/static

  repository:
    url: 'git@github.com:ESCL/pjtracker.git'
    branch: develop
    checkout: true

  ports:
    upstream: 8000
    downstream: 80

  secure: true

db: {}
