create-driver-three-file:
  file.managed:
    - name: /tmp/driver-three
    - makedirs: True
    - contents: |
        {{ pillar.up_driver_proxied.model }}
