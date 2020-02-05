# pull base image
FROM registry.access.redhat.com/ubi8/ubi:latest

RUN echo "===> Adding Ansible's prerequisites..."   && \
    yum update -y                                   && \
    yum install -y  \
                python2 python2-pip python2-devel    \
                libffi-devel                   \
                git \
                rsync  \
                cowsay && \
    python2 -m pip install --upgrade pip && \
    pip2 install --upgrade setuptools pip wheel      && \
    pip2 install --upgrade pyyaml jinja2 && \ 
    pip2 install --upgrade pywinrm                   && \
    pip2 install --upgrade pyvmomi                   && \
    pip2 install --upgrade ansible                   && \
    pip2 install --upgrade openstacksdk              && \
    pip2 install --upgrade bcrypt                    && \
    \
    curl -LO https://github.com/vmware/govmomi/releases/download/v0.21.0/govc_linux_amd64.gz && \
    gunzip govc_linux_amd64.gz                       && \
    chmod +x govc_linux_amd64                        && \
    cp govc_linux_amd64 /usr/bin/govc                && \
    echo "===> Clean up..."                                         && \
    yum clean all && \
    \
    echo "===> Adding hosts for convenience..."  && \
    mkdir -p /etc/ansible                        && \
    echo 'localhost' > /etc/ansible/hosts


WORKDIR /work

# default command: display Ansible version
CMD [ "ansible-playbook", "--version" ]
