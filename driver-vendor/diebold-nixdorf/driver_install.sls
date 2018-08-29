install-probase-javapos-driver:
  pkg.installed:
    - sources:
      - wn-probase-pos: salt://{{ slspath }}/files/wn-probase-pos-2.6.10-x86_64.rpm
    - skip_verify: True