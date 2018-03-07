create-driver-two-file:
  file.managed:
    - name: /tmp/driver-two
    - contents: |
        {{ pillar.up_driver_proxied.a }}
