{% set drivers = pillar['drivers'] %}

epson-environment:
   file.managed:
     - name: /etc/profile.d/epson.sh
     - source: salt://{{ slspath }}/files/environment.sh
     - mode: 775

{% for driver in drivers %}
{% if driver.packageName == 'epson' %}
downlad.epson.driver.package:
    file.managed:
        - name: /tmp/Epson_JavaPOS_ADK_1141_for_Linux.tar.gz
        - source: {{ driver.driverUrl }}
        - source_hash: 774b8082d1788e59688a5d284c9e4356
        - mode: 755
{% endif %}
{% endfor %}

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
