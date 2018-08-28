FROM alpine:latest

RUN apk update \
	&& apk add bash bash-completion \
#	&& apk add zsh \
	&& apk add curl \
	&& apk add git \
	&& apk add vim

COPY .bashrc /root
COPY tmp/.inputrc /root # to enable specific bash completion features; see file for details
#COPY tmp/.zshrc /root

RUN cd /root \
	&& ( \ 
        [ -d share ] && echo "Found share at $(pwd dev)" || mkdir share \
    ) \
	&& ( \
        [ -d dev ] && echo "Found dev at $(pwd dev)" || mkdir dev \
    )

RUN cd /root/dev \
	&& git clone https://github.com/guppytrain/planter.git

# run setup
RUN cd /root/dev/planter \
    && ([ -f "devseeds.sh" ] && ./devseeds.sh) \
    && ([ -f "duso.sh" ] && ./duso.sh)

RUN cd /root/dev/linux/bin \
    && ([ -f "setup.sh" ] && ./setup.sh -n)

RUN cd /root/dev/linux/bin \
    && ([ -f "base_install.sh" ] && ./base_install.sh)

#RUN cd /root/dev \
#	&& git clone https://github.com/zsh-users/zsh-syntax-highlighting.git

WORKDIR /root

CMD ["/bin/bash"]

