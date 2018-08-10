FROM alpine:3.8

RUN apk update \
	&& apk add bash bash-completion \
#	&& apk add zsh \
#	&& apk add curl \
	&& apk add git \
	&& apk add vim

RUN cd /root \
	&& ( [ -d share ] && echo "Found share at $(pwd dev)" ) || ( mkdir share )

RUN cd /root \
	&& ( [ -d dev ] && echo "Found dev at $(pwd dev)" ) || ( mkdir dev )

#RUN cd /root/dev \
#	&& git clone https://github.com/zsh-users/zsh-syntax-highlighting.git

COPY .bashrc /root
COPY .inputrc /root
#COPY .zshrc /root

COPY bootstrap.sh /root

# CMD ["cd"]

