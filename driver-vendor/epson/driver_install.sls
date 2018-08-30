{% set drivers = salt['pillar.get']('drivers') %}
{% set driverPackage = drivers | selectattr('packageName','equalto','epson') | map(attribute='driverUrl') | list %}

epson-environment:
  file.managed:
    - name: /etc/profile.d/epson.sh
    - source: salt://{{ slspath }}/files/environment.sh
    - mode: 775

downlad-epson-driver-package:
  file.managed:
    - name: /tmp/Epson_JavaPOS_ADK_1141_for_Linux.tar.gz
    - source: {{ driverPackage }}
    - skip_verify: True
    - mode: 755

extract-epson-adk-driver:
  archive.extracted:
    - name: /tmp/
    - source: /tmp/Epson_JavaPOS_ADK_1141_for_Linux.tar.gz
    - user: root
    - group: root

install-epson-adk-driver:
  cmd.run:
    - name: 'env && bash JavaPOSInstall.sh'
    - cwd: '/tmp/Epson_JavaPOS_ADK_1141_for_Linux'
    - env:
      - JAVA_HOME: /opt/jdk1.8.0_144
    - unless: 'ls /opt/EpsonJavaPOS'
