# SonarQube continuous inspection scanner

include:
  - core.unzip

sonar-scanner-install:
  archive.extracted:
    - name: /opt/
    - source: https://sonarsource.bintray.com/Distribution/sonar-scanner-cli/sonar-scanner-2.5.zip
    - archive_format: zip
    - user: root
    - if_missing: /opt/sonar-scanner-2.5
    - require:
      - pkg: unzip

sonar-scanner-config:
  file.managed:
    - name: /opt/sonar-scanner-2.5/conf/sonar-runner.properties
    - source: salt://services/sonar/scanner/sonar-runner.properties
    - template: jinja

sonar-scanner-bin:
  file.symlink:
    - name: /usr/local/bin/sonar-scanner
    - target: /opt/sonnar-scanner-2.5/bin/sonar-runner
