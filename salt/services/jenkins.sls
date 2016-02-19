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

jenkins:
  service.running:
    - require:
      - pkg: jenkins-install
