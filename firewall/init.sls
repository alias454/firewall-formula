{% from "firewall/map.jinja" import config with context %}

include:
  - .{{ config.include }}
