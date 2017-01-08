{% if salt['pillar.get']('firewall:firewalld:status') == 'Active' %}

service-iptables:
  service.disabled:
    - name: iptables
    - enable: False
    
service-ip6tables:
  service.disabled:
    - name: ip6tables
    - enable: False

package-firewalld:
  pkg.installed:
    - pkgs:
      - firewalld

service-firewalld:
  service.running:
    - name: firewalld
    - enable: True 
    - require:
      - pkg: package-firewalld
      - service: service-iptables 
      - service: service-ip6tables 

# change default zone, defaults to internal (from public)
command-firewalld-set-default-zone:
  cmd.run:
    - name: firewall-cmd --set-default-zone={{ salt['pillar.get']('firewall:firewalld:default_zone', 'internal') }}
    - unless: firewall-cmd --get-default-zone | grep {{ salt['pillar.get']('firewall:firewalld:default_zone', 'internal') }} 

command-firewalld-reload:
  cmd.run:
    - name: firewall-cmd --reload
    - onchanges:
      - cmd: command-firewalld-set-default-zone

{% elif salt['pillar.get']('firewall:firewalld:status') == 'InActive' %}

service-firewalld:
  service.dead:
    - name: firewalld
    - enable: False

{% endif %}
