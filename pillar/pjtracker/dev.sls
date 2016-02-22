app:
  name: pjtracker
  settings: 'tracker.settings.dev'
  root: apps/tracker
  static_root: apps/tracker/static

  repository:
    url: 'git@github.com:ESCL/salt-config.git'
    checkout: false

  ports:
    upstream: 8000
    downstream: 80
