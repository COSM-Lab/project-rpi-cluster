#!/bin/bash
for i in {1..42}
do
  ansible-playbook reconfigure-pilot-changed-gateway.yaml -e "source_pilot=$i target_pilot=$i" -u pilot --private-key=~/.ssh/sdPiLots --extra-vars "ansible_sudo_pass=pilot"
done