# amazon-linux-extras <cmd>
#   help      See list of commands.
#   info      See details of a specific package.
#   install   Enables specified topics and installs their packages.
#   list      Lists topics in the catalog. Some may be enabled.

# FROM amazonlinux
FROM guppytrain/amazonlinux_base

RUN echo "Base Install..." \
    && yum clean -q expire-cache \
    && yum install -y bash bash-completion \
    && yum install -y which \
    && yum install -y git \
    && yum install -y vim \
    && echo "Base Installed."

WORKDIR /root

COPY tmp/.bashrc /root
COPY tmp/.inputrc /root
COPY tmp/install.sh /root

# RUN ["/bin/bash", "install.sh"]
RUN /root/install.sh

CMD ["/bin/bash"]
