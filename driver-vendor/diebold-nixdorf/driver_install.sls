{% set drivers = salt['pillar.get']('drivers') %}
{% set driverPackage = drivers | selectattr('packageName','equalto','diebold-nixdorf') | map(attribute='driverUrl') | list %}

downlad-diebold-nixdorf-driver-package:
  file.managed:
    - name: /tmp/wn-probase-pos-2.6.10-x86_64.rpm
    - source: {{ driverPackage }}
    - skip_verify: True
    - mode: 755

install-probase-javapos-driver:
  pkg.installed:
    - sources:
      - wn-probase-pos: /tmp/wn-probase-pos-2.6.10-x86_64.rpm
    - skip_verify: True
