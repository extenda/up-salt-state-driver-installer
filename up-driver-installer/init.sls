{% set drivers = pillar['drivers'] %}

{% for driver in drivers %}
install-driver-{{ loop.index }}:
  module.run:
    - name: state.sls
    - mods:  driver-vendor/{{ driver.packageName }}
{% endfor %}

include:
  - .javapos
