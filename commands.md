<!-- sshpass on local machine is required for this configuration  -->

BUILD
`docker build -f Dockerfile.dockerfile -t ubuntu-ansible-ssh .`

RUN
`docker-compose up --detach`

SSH
<!-- Log in first time to estabilish fingerprint in known_hosts file -->
`ssh -p 222X node@localhost`
pwd: node1234

PING
<!-- group_name is the name of the group in inventory to run module-name -->
`ansible GROUP_NAME --module-name ping --inventory ansible/inventory/inventory.yaml --user=node --ask-pass`

PLAYBOOK
<!-- --ask-become-pass is only required if the playbook says 'become: true', meaning sudo required  -->
`ansible-playbook --inventory ansible/inventory/inventory.yaml ansible/playbooks/playbook-myhosts.yaml --ask-become-pass`
