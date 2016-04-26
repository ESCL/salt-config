app:
  name: pjtracker
  settings: 'tracker.settings.dev'
  root: apps/pjtracker
  static_root: apps/pjtracker/static

  repository:
    url: 'git@github.com:ESCL/pjtracker.git'
    branch: develop
    checkout: false

  ports:
    upstream: 8000
    downstream: 80

  secure: false

db: {}
