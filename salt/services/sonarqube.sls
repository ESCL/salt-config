# SonarQube continuous inspection server

include:
  - services.postgresql

sonar-install:
  archive.extracted:
    - name: /opt/
    - source: https://sonarsource.bintray.com/Distribution/sonarqube/sonarqube-5.3.zip
    - source_hash: md5=9ca7f69cce0bbbe519fc08da7c592d56
    - if_missing: /opt/sonarqube-5.3
    - require:
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

#sonar:
#  cmd.run:
#    - name: /opt/sonarqube-5.3/
#    - require:
#      - archive: sonar-install
#      - postgres_user: sonar-user
#      - postgres_database: sonar-db
