FROM amazonlinux:latest

RUN yum clean -q expire-cache
RUN yum install -y which

WORKDIR /root

CMD ["/bin/bash"]
