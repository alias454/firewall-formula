================
firewall-formula
================

A saltstack formula that can be used to manage iptables or firewalld services on RHEL based systems.

.. note::

    See the full `Salt Formulas installation and usage instructions
    <http://docs.saltstack.com/en/latest/topics/development/conventions/formulas.html>`_.

Available states
================

.. contents::
    :local:

``firewalld``
------------

Sets up the firewalld service and makes sure the service is running on RHEL/CentOS 7 systems.
Disables iptables modules if they exist.

``iptables``
------------

Sets up the iptables service and makes sure it is running on RHEL/CentOS 6 systems.
