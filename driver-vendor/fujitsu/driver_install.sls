extract-fujitsu-driver:
  archive.extracted:
    - name: /opt/
    - source: salt://{{ slspath }}/files/Fujitsu.tar.gz
    - user: root
    - group: root
