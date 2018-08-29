import copy
import glob
from lxml import etree

jpos_file = etree.Element("JposEntries")
for jpos_entry_file in glob.glob('/opt/JavaPOS/config_xml/*.xml'):
    original = etree.parse(jpos_entry_file)
    root = original.getroot()
    child = root.find('JposEntry')
    duplicate = copy.deepcopy(child)
    jpos_file.append(duplicate)
    et = etree.ElementTree(jpos_file)
    et.write('/opt/JavaPOS/config_xml/jpos.xml', pretty_print=True, method='xml', encoding='UTF-8')
