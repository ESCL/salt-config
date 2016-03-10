ssh-directory:
  file.directory:
    - name: {{ pillar['auth']['home'] }}/.ssh
    - user: {{ pillar['auth']['user'] }}
    - mode: 700

ssh-identity-file:
  file.managed:
    - name: {{ pillar['auth']['home'] }}/.ssh/id_rsa
    - user: {{ pillar['auth']['user'] }}
    - mode: 600
    - source: salt://core/ssh/id_rsa
    - require:
      - file: ssh-directory

ssh-public-key:
  file.managed:
    - name: {{ pillar['auth']['home'] }}/.ssh/id_rsa.pub
    - user: {{ pillar['auth']['user'] }}
    - mode: 600
    - source: salt://core/ssh/id_rsa.pub
    - require:
      - file: ssh-directory

ssh-github-host:
  ssh_known_hosts:
    - present
    - name: 'github.com'
    - user: {{ pillar['auth']['user'] }}
    - fingerprint: 16:27:ac:a5:76:28:2d:36:63:1b:56:4d:eb:df:a6:48
    - require:
      - file: ssh-directory

ssh-config:
  file.managed:
    - name: {{ pillar['auth']['home'] }}/.ssh/config
    - user: {{ pillar['auth']['user'] }}
    - mode: 600
    - template: jinja
    - source: salt://core/ssh/config
    - require:
      - file: ssh-directory
      - file: ssh-identity-file
      - file: ssh-public-key
