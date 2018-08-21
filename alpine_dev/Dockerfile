FROM alpine:3.8

RUN apk update \
	&& apk add bash bash-completion \
#	&& apk add zsh \
#	&& apk add curl \
	&& apk add git \
	&& apk add vim

COPY .bashrc /root
COPY ./tmp/.inputrc /root
#COPY ./tmp/.zshrc /root

RUN cd /root \
	&& ( [ -d share ] && echo "Found share at $(pwd dev)" ) || ( mkdir share )

RUN cd /root \
	&& ( [ -d dev ] && echo "Found dev at $(pwd dev)" ) || ( mkdir dev )

RUN cd /root/dev \
	&& git clone https://github.com/guppytrain/planter.git

# run setup
WORKDIR /root/dev/planter
RUN [ -f "devseeds.sh" ] && ./devseeds.sh

WORKDIR /root/dev/linux/bin
RUN [ -f "setup.sh" ] && ./setup.sh -n

#RUN cd /root/dev \
#	&& git clone https://github.com/zsh-users/zsh-syntax-highlighting.git

WORKDIR /root

# CMD ["cd"]

