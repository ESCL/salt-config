# Create and setup application virtualenv

include:
  - core.virtualenv
  - pjtracker.dependencies
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
    - requirements: {{ pillar['app']['root'] }}/requirements/prod-cpython.txt
    - require:
      - cmd: pip-update
      - cmd: pjtracker-repo-pull
      - pkg: pgsql-install
      - virtualenv: pjtracker-virtualenv
