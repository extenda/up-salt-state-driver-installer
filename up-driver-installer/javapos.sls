{% set peripherals = pillar['hardwareProfile']['peripherals'] %}

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
            peripherals: {{ peripherals }}

default.configuration.properties:
    file.managed:
        - name: /opt/extenda/pos/nodes/commonclientconfig/config/layers/DefaultConfigurationContext.properties
        - source: salt://{{ slspath }}/files/DefaultConfigurationContext.properties
        - template: jinja
        - context:
            peripherals: {{ peripherals }}

{% for peripheral in peripherals %}
config.{{ peripheral.hardware.model }}:
    file.managed:
        - name: /opt/extenda/pos/nodes/commonclientconfig/config/layers/{{ peripheral.hardware.layer }}/{{ peripheral.hardware.model }}.xml
        - source: salt://{{ slspath }}/files/device.xml
        - template: jinja
        - context:
            hardware: {{ peripheral.hardware }}
        - makedirs: True
{% endfor %}
