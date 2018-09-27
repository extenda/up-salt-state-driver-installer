{% set propertiesUrl = salt['pillar.get']('jposPaths:propertiesUrl') %}
{% set jposEntries = salt['pillar.get']('jposEntries:xmlUrl') %}
{% set layers = salt['pillar.get']('hardwareLayers') %}

jpos.properties:
  file.managed:
    - name: /opt/JavaPOS/config_xml/jpos/res/jpos.properties
    - source: salt://{{ slspath }}/files/jpos.properties
    - makedirs: True

downlad.jpospaths.properties:
  file.managed:
    - name: /opt/JavaPOS/jpospaths.properties
    - source: {{ propertiesUrl }}
    - skip_verify: True

set.environment.jpospaths.properties:
  cmd.run:
    - name: "cat /opt/JavaPOS/jpospaths.properties | tr -s '\n' | sed 's/^/export /' > /etc/profile.d/jpospaths.sh && chmod +x /etc/profile.d/jpospaths.sh"

salt.set.environment.jpospaths.properties:
  cmd.run:
    - name: "cat /opt/JavaPOS/jpospaths.properties | tr -s '\n' | sed 's/^/export /'"

download.jpos.xml:
  file.managed:
    - name: /opt/JavaPOS/config_xml/jpos.xml
    - source: {{ jposEntries }}
    - skip_verify: True

{% for layer in layers %}
config.{{ layer.layerName }}:
  file.managed:
    - name: /opt/extenda/pos/nodes/commonclientconfig/config/layers/{{ layer.layerName|capitalize }}/{{ layer.layerName|capitalize }}.xml
    - source: salt://{{ slspath }}/files/device.xml
    - template: jinja
    - context:
        layer: {{ layer }}
    - makedirs: True
    - force: True
{% endfor %}
