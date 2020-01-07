FROM debian:buster-slim

# For root:
# docker run -v /tmp/.X11-unix:/tmp/.X11-unix \
#            -e DISPLAY="unix$DISPLAY" \
#            -v /run/dbus/:/run/dbus/ \
#            -v /dev/shm:/dev/shm \
#            -v /etc/localtime:/etc/localtime:ro \
#            --device /dev/dri \
#            --group-add "$(getent group audio | cut -d: -f3)" \
#            -e PULSE_SERVER="unix:${XDG_RUNTIME_DIR}/pulse/native" \
#            -v "${XDG_RUNTIME_DIR}/pulse/native:${XDG_RUNTIME_DIR}/pulse/native" \
#            -e LANG \
#            -u 0:0 \
#            -v ${HOME}/.Amazon Web Services/Amazon WorkSpaces":"/Amazon Web Services/Amazon WorkSpaces"
#            linux-workspaces:latest

SHELL ["/bin/bash", "-o", "pipefail", "-c"]
RUN true && \
    apt-get update && apt-get --no-install-recommends -y install wget=1.20.* gnupg2=2.2* ca-certificates=2019* libpulse0=12.2-4* && \
    wget -q -O - https://workspaces-client-linux-public-key.s3-us-west-2.amazonaws.com/ADB332E7.asc | apt-key add - && \
    echo "deb [arch=amd64] https://d3nt0h4h6pmmc4.cloudfront.net/ubuntu bionic main" >> /etc/apt/sources.list.d/amazon-workspaces-clients.list && \
    apt-get update && apt-get install --no-install-recommends -y workspacesclient=3* && \
    useradd -m -d /home/user -s /bin/bash user \
    && rm -rf /var/lib/apt/lists/*

USER user


ENTRYPOINT ["/opt/workspacesclient/workspacesclient"]
