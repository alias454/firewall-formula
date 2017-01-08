{% from "firewall/map.jinja" import include_file with context %}

include:
  - .{{ include_file.include }}
