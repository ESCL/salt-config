# Create and setup application virtualenv

include:
  - core.virtualenv
  - services.postgresql
  - pjtracker.repository

pjtracker-virtualenv:
  virtualenv.managed:
    - name: {{ pillar['auth']['home'] }}/.virtualenvs/pjtracker
    - python: /usr/bin/python3
    - system_site_packages: False
    - user: {{ pillar['auth']['user'] }}
    - require:
      - file: virtualenvs-directory

pjtracker-requirements:
  pip.installed:
    - bin_env: {{ pillar['auth']['home'] }}/.virtualenvs/pjtracker
    - cwd: {{ pillar['auth']['home'] }}
    - no_chown: true
    - requirements: {{ pillar['auth']['home'] }}/{{ pillar['app']['root'] }}/requirements/prod.txt
    - require:
      - cmd: pip-update
      - git: pjtracker-repo
      - pkg: pgsql-install
      - virtualenv: pjtracker-virtualenv
