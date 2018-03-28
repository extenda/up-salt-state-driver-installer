{% set install_states = pillar['hardware-profile-installation']['states'] %}

jpos.properties:
    file.managed:
        - name: /opt/JavaPOS/config_xml/jpos/res/jpos.properties
        - source: salt://{{ slspath }}/files/jpos.properties
        - makedirs: True

jpospaths.properties:
    file.managed:
        - name: /opt/JavaPOS/jpospaths.properties
        - source: salt://{{ slspath }}/files/jpospaths.properties
        - makedirs: True

jpos.xml:
    file.managed:
        - name: /opt/JavaPOS/config_xml/jpos.xml
        - source: salt://{{ slspath }}/files/jpos.xml
        - makedirs: True
        - template: jinja
        - context:
            states: {{ install_states }}

default.configuration.properties:
    file.managed:
        - name: /opt/extenda/pos/nodes/commonclientconfig/config/layers/DefaultConfigurationContext.properties
        - source: salt://{{ slspath }}/files/DefaultConfigurationContext.properties
        - template: jinja
        - context:
            states: {{ install_states }}

{% for state in install_states %}
config.{{ state.parameters.device.name }}:
    file.managed:
        - name: /opt/extenda/pos/nodes/commonclientconfig/config/layers/Devices/{{ state.parameters.device.name }}.xml
        - source: salt://{{ slspath }}/files/device.xml
        - template: jinja
        - context:
            device: {{ state.parameters.device }}
        - makedirs: True
{% endfor %}
