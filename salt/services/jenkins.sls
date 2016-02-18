# Jenkins continuous integration server

jenkins-install:
  pkg.installed:
    - name: jenkins

jenkins:
  service.running:
    - require:
      - pkg: jenkins-install
