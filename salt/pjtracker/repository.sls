# Update repository

include:
  - core.git
  - core.ssh

pjtracker-repo:
  git.latest:
    - name: {{ pillar['app']['repository']['url'] }}
    - target: {{ pillar['auth']['home'] }}/{{ pillar['app']['root'] }}
    - branch: {{ pillar['app']['repository']['branch'] }}
    - force_checkout: {{ pillar['app']['repository']['checkout'] }}
    - user: {{ pillar['auth']['user'] }}
    - require:
      - file: ssh-config
      - ssh_known_hosts: ssh-github-host
