{% set install_states = pillar['hardware-profile-installation']['states'] %}

{% for state in install_states %}
proxy-run-{{ loop.index }}:
  module.run:
    - name: state.sls
    - mods: {{ state.name }}
    - kwargs:
        pillar:
          up_driver_proxied: {{ state.parameters }}
{% endfor %}
