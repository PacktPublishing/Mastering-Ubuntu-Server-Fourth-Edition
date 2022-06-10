FROM ubuntu
MAINTAINER Jay <jay@somewhere.net>
# Avoid confirmation messages
ARG DEBIAN_FRONTEND=noninteractive
# Update the container's packages
RUN apt update; apt dist-upgrade -y
# Install apache2 and vim
RUN apt install -y apache2 vim-nox
# Start Apache
ENTRYPOINT apache2ctl -D FOREGROUND
