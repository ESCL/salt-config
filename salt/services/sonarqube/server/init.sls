# SonarQube continuous inspection server

include:
  - services.postgresql
  - core.unzip

sonar-server-install:
  archive.extracted:
    - name: /opt/
    - source: https://sonarsource.bintray.com/Distribution/sonarqube/sonarqube-5.3.zip
    - source_hash: md5=9ca7f69cce0bbbe519fc08da7c592d56
    - archive_format: zip
    - user: root
    - if_missing: /opt/sonarqube-5.3
    - require:
      - pkg: unzip
      - pkg: pgsql-install

sonar-user:
  postgres_user.present:
    - name: {{ pillar['sonar']['user'] }}
    - password: {{ pillar['sonar']['password'] }}
    - user: postgres

sonar-db:
  postgres_database.present:
    - name: {{ pillar['sonar']['db'] }}
    - owner: {{ pillar['sonar']['user'] }}
    - user: postgres
    - require:
      - postgres_user: sonar-user

sonar-server-config:
  file.managed:
    - name: /opt/sonarqube-5.3/conf/sonar.properties
    - source: salt://services/sonarqube/server/sonar.properties
    - template: jinja

sonar-server:
  cmd.wait:
    - name: /opt/sonarqube-5.3/bin/linux-x86-64/sonar.sh restart
    - watch:
      - file: sonar-server-config
    - require:
      - archive: sonar-server-install
      - postgres_user: sonar-user
      - postgres_database: sonar-db
