# Install and configure postfix mail transfer agent

postfix-install:
  pkg.installed:
    - name: postfix

postfix-config:
  file.managed:
    - name: /etc/postfix/main.cf
    - source: salt://services/postfix/main.cf
    - template: jinja
    - require:
      - pkg: postfix-install

postfix-virtual:
  file.managed:
    - name: /etc/postfix/virtual
    - source: salt://services/postfix/virtual
    - template: jinja
    - require:
      - pkg: postfix-install

postfix:
  service.running:
    - require:
      - pkg: postfix-install
    - watch:
      - file: postfix-config

postmap:
  cmd.wait:
    - name: postmap /etc/postfix/virtual
    - cwd: /
    - watch:
      - file: /etc/postfix/virtual
