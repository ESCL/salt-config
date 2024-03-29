# Run required django commands before deployment

include:
  - pjtracker.environment

django-logdir:
  file.directory:
    - name: /var/log/django
    - user: {{ pillar['auth']['user'] }}
    - recurse:
      - user

django-migrate:
  cmd.run:
    - name: {{ pillar['auth']['home'] }}/.virtualenvs/pjtracker/bin/python manage.py migrate --noinput --settings={{ pillar['app']['settings'] }}
    - env:
    {% for key, value in pillar['db'].iteritems() %}
      - 'DB_{{ key.upper() }}': '{{ value }}'
    {% endfor %}
    - cwd: {{ pillar['auth']['home'] }}/{{ pillar['app']['root'] }}
    - user: {{ pillar['auth']['user'] }}
    - require:
      - pip: pjtracker-requirements
      - file: django-logdir

django-collectstatic:
  cmd.run:
    - name: {{ pillar['auth']['home'] }}/.virtualenvs/pjtracker/bin/python manage.py collectstatic --noinput --settings={{ pillar['app']['settings'] }}
    - env:
    {% for key, value in pillar['db'].iteritems() %}
      - 'DB_{{ key.upper() }}': '{{ value }}'
    {% endfor %}
    - cwd: {{ pillar['auth']['home'] }}/{{ pillar['app']['root'] }}
    - user: {{ pillar['auth']['user'] }}
    - require:
      - pip: pjtracker-requirements
      - file: django-logdir
