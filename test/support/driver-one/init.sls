create-driver-one-file:
  file.managed:
    - name: /tmp/driver-one
    - contents: |
        {{ pillar.up_driver_proxied.a }}
