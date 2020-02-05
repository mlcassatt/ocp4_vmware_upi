# OCP 4.x Ansible Installation on VMWare

## Assumptions:
 * VMWare pre-configured with service user following guide here: https://vmware.github.io/vsphere-storage-for-kubernetes/documentation/vcp-roles.html#dynamic-provisioning
 * HAProxy configured appropriately (to be automated)
 * System identified as DHCP server with package management and build as RHEL 7.6+
 * ssh-keys configured to each host for Ansible automation

We'll either build or make use of my shared ubi8-based container running pyvmomi and Ansible appropriate with all required dependencies

## Use it

Build the Container Image or download it
`podman build . -t pyvmomi`

Run the ansible
`podman run -it --rm --name ansible -v `pwd`:/work/:Z -v `pwd`:/etc/ansible:Z localhost/pyvmomi ansible-playbook main.yml`

## License

BSD
