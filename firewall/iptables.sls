{% if salt['pillar.get']('firewall:iptables:status') == 'Active' %}
{% from "firewall/map.jinja" import config with context %}

service-firewalld:
  service.dead:
    - name: firewalld
    - enable: False

package-iptables:
  pkg.installed:
    - pkgs:
      - iptables

service-iptables:
  service.running:
    - name: {{ config.service }}
    - enable: True

{% if salt['pillar.get']('firewall:ip6tables:status') == 'Active' %}
service-ip6tables:
  service.running:
    - name: ip6tables
    - enable: True
{% elif salt['pillar.get']('firewall:ip6tables:status') == 'InActive' %}
service-ip6tables:
  service.dead:
    - name: ip6tables
    - enable: False
{% endif %}

{% elif salt['pillar.get']('firewall:iptables:status') == 'InActive' %}

service-iptables:
  service.dead:
    - name: iptables
    - enable: False

service-ip6tables:
  service.dead:
    - name: ip6tables
    - enable: False

{% endif %}
