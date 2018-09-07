FROM <BASE_IMAGE>

RUN echo "Base Install..." \
    # && <PKG_MGR> <INSTALL> <PKG_NAME> \
    && echo "Base Installed."

WORKDIR /root

# intermediate folder destinations will be created as needed
# COPY tmp/<FILE> /root
# COPY <FILE> /root

# RUN ["/bin/bash", "install.sh"]
# RUN /root/install.sh

CMD ["/bin/bash"]
