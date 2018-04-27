# Etherpad-Lite Dockerfile
#
# https://github.com/ether/etherpad-docker
#
# Developed from a version by Evan Hazlett at https://github.com/arcus-io/docker-etherpad
#
# Version 1.0

# Use Docker's nodejs, which is based on ubuntu
FROM node:latest
# MAINTAINER John E. Arnold, iohannes.eduardus.arnold@gmail.com

# Get Etherpad-lite's other dependencies
RUN apt-get update \
    && apt-get install -y \
        build-essential \
        curl \
        git-core \
        gzip \
        libssl-dev \
        pkg-config \
        python \
        supervisor \
    && apt-get clean

# Grab the latest Git version
RUN git clone https://github.com/ether/etherpad-lite.git /opt/etherpad

# Install node dependencies
RUN /opt/etherpad/bin/installDeps.sh

# Add conf files
ADD settings.json /opt/etherpad/settings.json
ADD supervisord.conf /etc/supervisord.conf

VOLUME /var/etherpad

EXPOSE 9001

CMD ["supervisord", "-c", "/etc/supervisord.conf"]
