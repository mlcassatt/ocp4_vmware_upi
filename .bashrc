# .bashrc

# User specific aliases and functions

alias rm='rm -i'
alias cp='cp -i'
alias mv='mv -i'

# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

source scl_source enable python27
export GOVC_URL='https://ocp4-service-user:0cpYe@hEweKn0wMi!@vmware.rhc-lab.iad.redhat.com/sdk'
export GOVC_DATACENTER=RHC-VMware-Cluster
export GOVC_INSECURE=true
