FROM ubuntu:18.04

# timesys host requirements
ENV DEBIAN_FRONTEND noninteractive
RUN dpkg-reconfigure -p critical dash

# COPY sources.list /etc/apt/sources.list
RUN apt-get update && apt-get install -y --force-yes \
          automake binutils-dev bison build-essential bzip2 ecj fastjar \
          flex gawk gconf2 gettext gperf groff gtk-doc-tools icon-naming-utils indent \
          libc6-dev libdbus-glib-1-dev libexpat1-dev libglade2-dev libgmp3-dev libgtk2.0-bin \
          libgtk2.0-dev libmpfr-dev libncurses5-dev libperl-dev libsdl1.2-dev libssl-dev libtool libusb-dev \
          libxml-parser-perl lzop python-dev python-libxml2 ruby scons sharutils swig texinfo \
          texlive-extra-utils unzip wget x11-xkb-utils xfonts-utils zip zlib1g \
          lib32ncurses5 lib32z1 lib32z1-dev libc6-dev-i386 \
          guile-2.2 texlive-latex-extra
RUN apt-get update && apt-get install -y --force-yes sudo

RUN ln -sfn /bin/bash /bin/sh

RUN mkdir -p /home/worker && \
    mkdir -p /home/worker/building && \
    echo "worker:x:1000:1000:worker,,,:/home/worker:/bin/bash" >> /etc/passwd && \
    echo "worker:x:1000:" >> /etc/group && \
    echo "worker ALL=(ALL) NOPASSWD: ALL" > /etc/sudoers.d/worker && \
    chmod 0440 /etc/sudoers.d/worker && \
    chown worker:worker -R /home/worker && \
    chown root:root /usr/bin/sudo && chmod 4755 /usr/bin/sudo

USER worker
ENV HOME /home/worker
WORKDIR /home/worker/building
CMD /bin/bash