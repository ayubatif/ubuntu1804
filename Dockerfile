FROM ubuntu:18.04 as base

COPY . /project

# often you may need to symlink scripts as well as when using gcc libs
RUN apt-get update && \
    apt-get upgrade && \
    apt-get install -yqq \
      curl \
      gpg \
      apt-transport-https \
    && \
    /bin/bash -e /clean.sh && \
    apt-get remove --purge --auto-remove systemd --allow-remove-essential -y
