app:
  name: pjtracker
  settings: 'tracker.settings.demo'
  root: apps/pjtracker
  static_root: apps/pjtracker/static

  repository:
    url: 'git@github.com:ESCL/pjtracker.git'
    checkout: true

  ports:
    upstream: 8000
    downstream: 80

