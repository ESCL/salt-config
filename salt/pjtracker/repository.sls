# Update repository

include:
  - core.git
  - core.ssh

# Broken in current version (https://github.com/saltstack/salt/issues/28287)?
pjtracker-repo:
  git.latest:
    - name: {{ pillar['app']['repository']['url'] }}
    - target: {{ pillar['auth']['home'] }}/{{ pillar['app']['root'] }}
    - force_checkout: {{ pillar['app']['repository']['checkout'] }}
    - user: {{ pillar['auth']['user'] }}
    - require:
      - file: ssh-config
      - ssh_known_hosts: ssh-bitbucket-host
