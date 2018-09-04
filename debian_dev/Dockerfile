FROM debian:stretch-slim

RUN apt-get update \ 
    # && apt-get upgrade \
    # && apt-get install -y apt-utils \
    && echo "Done with apt-get updates"

RUN echo "Installing base apps..." \
	&& apt-get install -y bash bash-completion \
	&& apt-get install -y git \
	&& apt-get install -y vim \
    && echo "Done with base apps"

COPY tmp/.bashrc /root
COPY tmp/.inputrc /root

COPY tmp/install.sh /root/bin/install.sh
# not running install.sh because of unresolved issues in image build step

WORKDIR /root

CMD ["/bin/bash"]
