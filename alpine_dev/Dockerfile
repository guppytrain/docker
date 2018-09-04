FROM alpine:latest

RUN echo "bash completion INIT" \
    && apk update \
    && apk add bash bash-completion \
    && echo "bash completion DONE"

COPY .bashrc /root
COPY tmp/.inputrc /root 

# ENV LANG=C.UTF-8

ENV ALPINE_GLIBC_BASE_PACKAGE_FILENAME glibc-2.28-r0.apk
ENV ALPINE_GLIBC_BIN_PACKAGE_FILENAME glibc-bin-2.28-r0.apk
ENV ALPINE_GLIBC_I18N_PACKAGE_FILENAME glibc-i18n-2.28-r0.apk

COPY glibc /root/tmp/

# Here we install GNU libc (aka glibc) and set C.UTF-8 locale as default.
RUN echo "glibc 2.28 INIT" \
    && apk update \ 
    && apk add --no-cache --virtual=.build-dependencies ca-certificates \ 
    && apk add --no-cache --allow-untrusted \
        # "/root/tmp/$ALPINE_GLIBC_BASE_PACKAGE_FILENAME" \
        # "/root/tmp/$ALPINE_GLIBC_BIN_PACKAGE_FILENAME" \
        # "/root/tmp/$ALPINE_GLIBC_I18N_PACKAGE_FILENAME" \
        "/root/tmp/$ALPINE_GLIBC_BASE_PACKAGE_FILENAME" \
        "/root/tmp/$ALPINE_GLIBC_BIN_PACKAGE_FILENAME" \
        # "/root/tmp/$ALPINE_GLIBC_I18N_PACKAGE_FILENAME" \
    # /usr/glibc-compat/bin/localedef --force --inputfile POSIX --charmap UTF-8 "$LANG" || true \
    # && echo "export LANG=$LANG" > /etc/profile.d/locale.sh \
    # && apk del glibc-i18n \
    && apk del .build-dependencies \
    && rm "/root/tmp/$ALPINE_GLIBC_BASE_PACKAGE_FILENAME" \
    && rm "/root/tmp/$ALPINE_GLIBC_BIN_PACKAGE_FILENAME" \
    && rm "/root/tmp/$ALPINE_GLIBC_I18N_PACKAGE_FILENAME" \
    && echo "glibc DONE"

# Requirements for nvm, node, and npm
RUN echo "nvm alpine requirements INIT" \
    && apk add -U openssl ncurses coreutils python2 make gcc g++ libgcc linux-headers util-linux binutils findutils \
    && echo "nvm alpine requirements DONE" 

# run setup
RUN echo "Setup INIT" \
    && apk add git \
    && cd /root \
	&& mkdir share \
	&& mkdir dev \
    && cd /root/dev \
    && echo "Grabbing git repos" \
	&& git clone https://github.com/guppytrain/planter.git \    
    && cd /root/dev/planter \
    && echo "Running plant.sh" \
    && ([ -f "plant.sh" ] && ./plant.sh -d) \
    && echo "initial setup" \
    && cd /root/dev/linux/bin \
    && ([ -f "setup.sh" ] && ./setup.sh -n) \
    && echo "base install" \
    && ([ -f "base_install.sh" ] && ./base_install.sh) \
    && cd /root/dev/linux/bin/installers \
    && echo "vim plugins" \
    && ([ -f "vim_plugins_install.sh" ] && ./vim_plugins_install.sh) \
    && echo "Setup DONE"

WORKDIR /root

CMD ["/bin/bash"]

