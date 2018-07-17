create-driver-two-file:
  file.managed:
    - name: /tmp/driver-two
    - makedirs: True
    - contents: |
        {{ pillar.up_driver_proxied.model }}
