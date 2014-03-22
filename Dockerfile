#
# Etherpad-Lite Dockerfile
#
# https://github.com/Leibnitius/etherpad-dockerfile
#
# Version 0.1

# Use Docker's nodejs, which is based on ubuntu
FROM dockerfile/nodejs

# Get Etherpad-lite's other dependencies
RUN apt-get update
RUN apt-get install gzip git-core curl python libssl-dev pkg-config build-essential

# Grab the latest Git version
RUN git clone git://github.com/ether/etherpad-lite.git
RUN cd etherpad-lite

EXPOSE 9001
ENTRYPOINT bin/run.sh