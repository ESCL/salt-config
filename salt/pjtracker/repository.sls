# Update repository

include:
  - core.git
  - core.ssh

#pjtracker-repo-checkout:
#  cmd.run:
#    - name: git checkout -- .
#    - cwd: {{ pillar['app']['root'] }}
#    - user: {{ pillar['auth']['user'] }}
#    - require:
#      - pkg: git

# Upgrade protocol to ssh and use deployment key (no passwd)
#pjtracker-repo-protocol:
#  cmd.run:
#    - name: git remote set-url origin 'git+ssh://git@bitbucket.org/escng/tracker.git'
#    - cwd: {{ pillar['app']['root'] }}
#    - user: {{ pillar['auth']['user'] }}
#    - require:
#      - pkg: git

# Temp hack for broken git.latest (see below)
#pjtracker-repo-pull:
#  cmd.run:
#    - name: git pull
#    - cwd: {{ pillar['app']['root'] }}
#    - user: {{ pillar['auth']['user'] }}
#    - require:
#      - pkg: git
#      - file: ssh-config
#      - ssh_known_hosts: ssh-bitbucket-host
#      - cmd: pjtracker-repo-checkout
#      - cmd: pjtracker-repo-protocol

# Broken in current version (https://github.com/saltstack/salt/issues/28287)?
pjtracker-repo-pull:
  git.latest:
    - name: {{ pillar['app']['repository']['url'] }}
    - rev: master
    - target: {{ pillar['app']['root'] }}
    - force_checkout: {{ pillar['app']['repository']['checkout'] }}
    - user: {{ pillar['auth']['user'] }}
    - require:
      - file: ssh-config
      - ssh_known_hosts: ssh-bitbucket-host
