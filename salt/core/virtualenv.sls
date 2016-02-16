# Setup virtualenv use (install env, wrapper and create container dir)

include:
  - core.python

virtualenv:
  pip.installed:
    - name: virtualenv
    - require:
      - pkg: pip

virtualenvwrapper:
  pip.installed:
    - name: virtualenvwrapper
    - require:
      - pip: virtualenv

virtualenvs-directory:
  file.directory:
    - name: {{ pillar['auth']['home'] }}/.virtualenvs
    - user: {{ pillar['auth']['user'] }}
    - group: {{ pillar['auth']['group'] }}
    - dir_mode: 755
    - require:
      - pip: virtualenvwrapper
