Dockerfile for Linux client for AWS Workspaces.

Run this with something like the following:

```sh
docker run -v /tmp/.X11-unix:/tmp/.X11-unix \
           -e DISPLAY="unix$DISPLAY" \
           -v /run/dbus/:/run/dbus/ \
           -v /dev/shm:/dev/shm \
           -v /etc/localtime:/etc/localtime:ro \
           --device /dev/dri \
           --group-add "$(getent group audio | cut -d: -f3)" \
           -e PULSE_SERVER="unix:${XDG_RUNTIME_DIR}/pulse/native" \
           -v "${XDG_RUNTIME_DIR}/pulse/native:${XDG_RUNTIME_DIR}/pulse/native" \
           -e LANG \
           -u 0:0 \
           -v ${HOME}/.Amazon Web Services/Amazon WorkSpaces":"/Amazon Web Services/Amazon WorkSpaces"
           elerch/linux-workspaces:latest
```
