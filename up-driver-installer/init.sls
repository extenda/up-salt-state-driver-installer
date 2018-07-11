{% set hardware_profile_states = pillar['hardware-profile']['states'] %}
#{% set node_id = salt['grains.get']('node_id') %}

#ext_pillar:
#  - http_json:
#    url: http://fleetmanager.extenda.io/staging/nodes/1

{% for state in hardware_profile_states %}
proxy-run-{{ loop.index }}:
  module.run:
    - name: state.sls
    - mods: {{ state.name }}
    - kwargs:
        pillar:
          up_driver_proxied: {{ state.hardware }}
{% endfor %}

include:
  - .javapos
