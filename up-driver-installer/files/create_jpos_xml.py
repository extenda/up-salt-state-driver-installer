import copy
import glob
from lxml import etree
import StringIO

jpos_file = '/opt/JavaPOS/config_xml/jpos.xml'

template = """
<!DOCTYPE JposEntries PUBLIC "-//JavaPOS//DTD//EN"
                             "jpos/res/jcl.dtd">
<JposEntries>
</JposEntries>
"""

jpos_template = etree.parse(StringIO.StringIO(template))
jpos_template.write(jpos_file, pretty_print=True)

jpos_file_parsed = etree.parse(jpos_file)
jpos_file_root = jpos_file_parsed.getroot()

for jpos_entry_file in glob.glob('/opt/JavaPOS/config_xml/*.xml'):
    original = etree.parse(jpos_entry_file)
    root = original.getroot()
    for child in root.findall('JposEntry'):
        duplicate = copy.deepcopy(child)
        jpos_file_root.append(duplicate)
jpos_entries = etree.ElementTree(jpos_file_root)
jpos_entries.write(jpos_file, pretty_print=True, method='xml', xml_declaration=True, encoding='UTF-8')
