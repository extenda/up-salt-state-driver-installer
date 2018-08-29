{% set drivers = pillar['drivers'] %}

datalogic-environment:
  file.managed:
    - name: /etc/profile.d/datalogic.sh
    - source: salt://{{ slspath }}/files/environment.sh
    - mode: 755

{% for driver in drivers %}
{% if driver.packageName == 'datalogic' %}
downlad.datalogic.driver.package:
    file.managed:
        - name: /tmp/setup.jar
        - source: {{ driver.driverUrl }}
        - source_hash: 66e3e075d3c18bfcbd3e50c41341406b
        - mode: 755
{% endif %}
{% endfor %}

/tmp/autoinst.xml:
  file.managed:
    - source: salt://{{ slspath }}/files/autoinst.xml
    - mode: 755

/tmp/dls.properties:
  file.managed:
    - source: salt://{{ slspath }}/files/dls.properties
    - mode: 755

install-datalogic-dls-driver:
  cmd.run:
    - name: 'java -jar setup.jar /tmp/autoinst.xml'
    - cwd: '/tmp'
    - env:
      - JAVA_HOME: /opt/jdk1.8.0_144
    - unless: 'ls /opt/dls'
