# Jenkins continuous integration server

jenkins-ppa:
  pkgrepo.managed:
    - humanname: Jenkins PPA
    - name: deb http://pkg.jenkins-ci.org/debian binary/
    - file: /etc/apt/sources.list.d/jenkins.list
    - key_url: https://jenkins-ci.org/debian/jenkins-ci.org.key
    - require_in:
      - pkg: jenkins-install

jenkins-install:
  pkg.installed:
    - name: jenkins

# SSH private key required to pull repositories
jenkins-identity-file:
  file.managed:
    - name: /var/jenkins/.ssh/id_rsa
    - user: jenkins
    - mode: 600
    - source: salt://core/ssh/id_rsa
    - require:
      - pkg: jenkins-install

# SSH public key required to pull repositories
jenkins-public-key:
  file.managed:
    - name: /var/jenkins/.ssh/id_rsa.pub
    - user: jenkins
    - mode: 600
    - source: salt://core/ssh/id_rsa.pub
    - require:
      - pkg: jenkins-install

jenkins:
  service.running:
    - require:
      - pkg: jenkins-install
      - file: jenkins-identity-file
      - file: jenkins-public-key
