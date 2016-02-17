app:
  name: pjtracker
  root: /home/vagrant/repos/tracker
  static_root: /home/vagrant/repos/tracker/static

  repository:
    url: 'git+ssh://git@bitbucket.org/escng/tracker.git'
    checkout: false

  ports:
    upstream: 8000
    downstream: 80

  db: {}
