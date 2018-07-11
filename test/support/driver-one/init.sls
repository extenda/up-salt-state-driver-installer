create-driver-one-file:
  file.managed:
    - name: /tmp/driver-one
    - makedirs: True
    - contents: |
        {{ pillar.up_driver_proxied.hardware }}
