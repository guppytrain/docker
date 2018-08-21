FROM debian:stable-slim

RUN apt-get update \ 
    # && apt-get upgrade \
    # && apt-get install -y apt-utils \
    && echo "Done with apt-get updates"

RUN echo "Installing base apps..." \
	# && apt-get install -y bash-completion \
	# && apt-get install -y zsh \
	# && apt-get install -y curl \
	# && apt-get install -y git \
	# && apt-get install -y vim \
    && echo "Done with base apps"

COPY common/.bashrc /root
COPY common/.inputrc /root
#COPY common/.zshrc /root

COPY install.sh /root/bin/install.sh

RUN cd /root \
	&& ( [ -d share ] && echo "Found share at $(pwd dev)" ) || ( mkdir share )

RUN cd /root \
	&& ( [ -d dev ] && echo "Found dev at $(pwd dev)" ) || ( mkdir dev )

# RUN cd /root/dev \
# 	&& git clone https://github.com/guppytrain/planter.git
#
# # run setup
# WORKDIR /root/dev/planter
# RUN [ -f "devseeds.sh" ] && ./devseeds.sh
#
# WORKDIR /root/dev/linux/bin
# RUN [ -f "setup.sh" ] && ./setup.sh -n
#
#RUN cd /root/dev \
#	&& git clone https://github.com/zsh-users/zsh-syntax-highlighting.git

WORKDIR /root

CMD ["/bin/bash"]

