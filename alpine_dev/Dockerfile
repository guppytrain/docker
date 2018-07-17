FROM alpine:3.8

RUN apk update \
	&& apk add bash bash-completion \
	&& apk add zsh \
	&& apk add git \
	&& apk add vim

RUN cd /root \
	&& git clone https://github.com/zsh-users/zsh-syntax-highlighting.git

COPY .bashrc /root
COPY .zshrc /root

#CMD ["bash"]

