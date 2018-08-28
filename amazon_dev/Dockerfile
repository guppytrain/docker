FROM amazonlinux:latest

RUN yum clean -q expire-cache
RUN yum install -y which
    # && yum install -y vim \
    # && yum install -y git \
    # && yum install -y curl \
    # && yum install -y wget \

WORKDIR /root

CMD ["/bin/bash"]
