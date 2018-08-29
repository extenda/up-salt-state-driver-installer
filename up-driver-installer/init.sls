{% set drivers = pillar['drivers'] %}

{% for driver in drivers %}
install-driver-{{ loop.index }}:
  module.run:
    - name: state.sls
    - mods:  salt://{{ slspath }}/vendor/{{ driver.packageName }}
    - kwargs:
        pillar:
          driverUrl: {{ driver.driverUrl }}
{% endfor %}

include:
  - .javapos
