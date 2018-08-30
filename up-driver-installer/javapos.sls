{% set propertiesUrl = salt['pillar.get']('jposPaths:propertiesUrl') %}
{% set jposEntries = pillar['jposEntries']  %}
{% set layers = pillar['layers'] %}

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

source.jpospaths.properties:
  cmd.run:
    - name: "cat /opt/JavaPOS/jpospaths.properties | sed 's/^/export /' > /etc/profile.d/jpospaths.sh"

{% for jposEntry in jposEntries %}
download.jposentry.{{ loop.index }}:
  file.managed:
    - name: /opt/JavaPOS/config_xml/{{ loop.index }}.xml
    - source: {{ jposEntry.xmlUrl }}
    - skip_verify: True
{% endfor %}

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

install.python.pip:
  cmd.run:
    - name: 'yum -y install python-pip'

update.python.pip:
  cmd.run:
    - name: 'pip install --upgrade pip'

pip.dependencies:
  pip.installed:
    - names:
      - glob2==0.6
      - lxml==4.2.4

transfer.python.file:
  file.managed:
    - name: /tmp/create_jpos_xml.py
    - source: salt://{{ slspath }}/files/create_jpos_xml.py

create.jpos.xml:
  cmd.run:
    - name: 'python /tmp/create_jpos_xml.py'
