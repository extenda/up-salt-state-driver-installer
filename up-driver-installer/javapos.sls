{% set propertiesUrl = salt['pillar.get']('jposPaths:propertiesUrl') %}
{% set xmlUrl = salt['pillar.get']('jposEntries:xmlUrl') %}
{% set hardwareLayers = salt['pillar.get']('hardwareLayers') %}

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
    - source: {{ xmlUrl }}
    - skip_verify: True

{% for layer in hardwareLayers %}
config.{{ layer.layer }}:
  file.managed:
    - name: /opt/extenda/pos/nodes/commonclientconfig/config/layers/{{ layer.layer|capitalize }}/{{ layer.layer|capitalize }}.xml
    - source: salt://{{ slspath }}/files/device.xml
    - template: jinja
    - context:
        layer: {{ layer }}
    - makedirs: True
    - force: True
{% endfor %}
