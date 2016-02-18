app:
  name: pjtracker
  settings: 'tracker.settings.demo'
  root: apps/tracker
  static_root: apps/tracker/static

  repository:
    url: 'git+ssh://git@bitbucket.org/escng/tracker.git'
    checkout: true

  ports:
    upstream: 8000
    downstream: 80

