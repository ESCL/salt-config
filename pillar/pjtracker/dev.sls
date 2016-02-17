app:
  name: pjtracker
  root: /home/vagrant/apps/tracker
  static_root: /home/vagrant/apps/tracker/static

  repository:
    url: 'git+ssh://git@bitbucket.org/escng/tracker.git'
    checkout: false

  ports:
    upstream: 8000
    downstream: 80

  db: {}
