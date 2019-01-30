Ansible ELK
=========

Ansible project to deploy ELK Stack. The whole stack configuration is included within this repo.

Requirements
------------

- Python 2.6 (or higher)
- Java 8
- ELK 6.3.0 (or higher)

Tested on Redhat 6/7 environments, should work on similar distributions (CentOs/Fedora/Ubunto). Check https://www.elastic.co/support/matrix for compatibility.

Environment variables
------------

Node installation paths:
- Ansible-elk/roles/common/defaults/main.yml

Node IPs:
- Ansible-elk/inventario/*

Project paths:
- Ansible-elk/Menu-ELK.sh

Run
--------------

./Menu-ELK.sh