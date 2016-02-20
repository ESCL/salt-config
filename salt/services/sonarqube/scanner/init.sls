# SonarQube continuous inspection scanner

include:
  - core.unzip

sonar-scanner-download:
  cmd.run:
    - name: curl -L https://sonarsource.bintray.com/Distribution/sonar-scanner-cli/sonar-scanner-2.5.zip -o {{ pillar['auth']['home'] }}/sonar-scanner-2.5.zip
    - creates: {{ pillar['auth']['home'] }}/sonar-scanner-2.5.zip

sonar-scanner-install:
  archive.extracted:
    - name: /opt/sonar-scanner-2.5
    - source: file:/{{ pillar['auth']['home'] }}/sonar-scanner-2.5.zip
    - archive_format: zip
    - if_missing: /opt/sonar-scanner-2.5
    - user: root
    - require:
      - cmd: sonar-scanner-download
      - pkg: unzip

sonar-scanner-config:
  file.managed:
    - name: /opt/sonar-scanner-2.5/conf/sonar-runner.properties
    - source: salt://services/sonarqube/scanner/sonar-runner.properties
    - template: jinja
    - require:
      - archive: sonar-scanner-install

sonar-scanner-bin:
  file.symlink:
    - name: /usr/local/bin/sonar-scanner
    - target: /opt/sonar-scanner-2.5/bin/sonar-runner
    - user: root
    - require:
      - archive: sonar-scanner-install
