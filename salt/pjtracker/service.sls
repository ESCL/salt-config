# Init/reload uwsgi application server

include:
  - pjtracker.setup

uwsgi-logdir:
  file.directory:
    - name: /var/log/uwsgi
    - user: {{ pillar['auth']['user'] }}
    - recurse:
      - user

uwsgi-run:
  cmd.run:
    - name: {{ pillar['auth']['home'] }}/.virtualenvs/pjtracker/bin/uwsgi --ini tracker/uwsgi.ini --DJANGO_SETTINGS_MODULE={{ pillar['app']['settings'] }}
    - cwd: {{ pillar['auth']['home'] }}/{{ pillar['app']['root'] }}
    - user: {{ pillar['auth']['user'] }}
    - unless: test -e /tmp/uwsgi-fifo
    - require:
      - cmd: django-migrate
      - cmd: django-collectstatic

uwsgi-reload:
  cmd.run:
    - name: echo r > /tmp/uwsgi-fifo
    - cwd: {{ pillar['auth']['home'] }}/{{ pillar['app']['root'] }}
    - user: {{ pillar['auth']['user'] }}
    - onlyif: test -e /tmp/uwsgi-fifo
    - require:
      - cmd: django-migrate
      - cmd: django-collectstatic
