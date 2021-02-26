FROM ubuntu:18.04

ENV DEBIAN_FRONTEND noninteractive
RUN dpkg-reconfigure -p critical dash

RUN apt-get -y update && apt-get install -y --no-install-recommends --no-cache \
          automake binutils-dev bison build-essential bzip2 ecj fastjar \
          flex gawk gconf2 gettext gperf groff gtk-doc-tools icon-naming-utils indent \
          libc6-dev libdbus-glib-1-dev libexpat1-dev libglade2-dev libgmp3-dev libgtk2.0-bin \
          libgtk2.0-dev libmpfr-dev libncurses5-dev libperl-dev libsdl1.2-dev libssl-dev libtool libusb-dev \
          libxml-parser-perl lzop python-dev python-libxml2 ruby scons sharutils swig texinfo \
          texlive-extra-utils unzip wget x11-xkb-utils xfonts-utils zip zlib1g time ssh lib32z1 \
          lib32z1-dev libc6-dev-i386 git bc guile-2.2 texlive-latex-extra sudo lib32ncurses5 joe vim \
          libelf-dev tzdata autoconf autopoint rsync openjdk-8-jdk less bash cpio

RUN useradd --create-home --shell /bin/bash worker \
    && echo "worker ALL=(ALL) NOPASSWD: ALL" > /etc/sudoers.d/worker \
    && chmod 0640 /etc/sudoers.d/worker

RUN sudo update-alternatives --set java /usr/lib/jvm/java-8-openjdk-amd64/jre/bin/java

USER worker
WORKDIR /home/worker/build

ENV GIT_SSH_COMMAND 'ssh -i /home/worker/.ssh/id_rsa'
ENV JAVA_HOME '/usr/lib/jvm/java-8-openjdk-amd64/'

CMD /bin/bash
