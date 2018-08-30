{% set drivers = salt['pillar.get']('drivers') %}
{% set driverPackage = drivers | selectattr('packageName','equalto','fujitsu') | map(attribute='driverUrl') | list %}

downlad-fujitsu-driver-package:
  file.managed:
    - name: /tmp/Fujitsu.tar.gz
    - source: {{ driverPackage }}
    - skip_verify: True
    - mode: 755

extract-fujitsu-driver:
  archive.extracted:
    - name: /opt/
    - source: /tmp/Fujitsu.tar.gz
    - user: root
    - group: root
