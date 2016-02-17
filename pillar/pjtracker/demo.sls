app:
  name: pjtracker
  root: /home/ubuntu/repos/tracker
  static_root: /home/ubuntu/repos/tracker/static

  repository:
    url: 'git+ssh://git@bitbucket.org/escng/tracker.git'
    checkout: true

  ports:
    upstream: 8000
    downstream: 80

  db:
    engine: 'django.db.backends.postgresql_psycopg2'
    host: 'pjtracker0.c8hyiihqnbry.us-east-1.rds.amazonaws.com'
    port: 5432
    name: 'pjtracker'
    user: 'pjtracker'
    password: 'tr4ckmypjs'
