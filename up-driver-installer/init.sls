{% set peripherals = pillar['hardwareProfile']['peripherals'] %}

{% for peripheral in peripherals %}
proxy-run-{{ loop.index }}:
  module.run:
    - name: state.sls
    - mods: {{ peripheral.name }}
    - kwargs:
        pillar:
          up_driver_proxied: {{ peripheral.hardware }}
{% endfor %}

include:
  - .javapos
