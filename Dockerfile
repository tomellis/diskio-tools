FROM ubuntu
MAINTAINER "Tom Ellis <ellistr@amazon.com>"

# Bonnie++ Version here: https://doc.coker.com.au/projects/bonnie/
# IOZone Version here: http://www.iozone.org/src/current/
ENV BONNIE_VERSION=1.98 \
    IOZONE_VERSION=3_493 \
    SHELL=/bin/bash

RUN apt-get update --fix-missing
RUN apt-get upgrade -y
RUN apt-get install -y build-essential gcc wget make perl openssl

# Build Bonnie++
RUN \
  cd /tmp && \
  wget https://www.coker.com.au/bonnie++/bonnie++-${BONNIE_VERSION}.tgz && \
  tar -xvf bonnie++-${BONNIE_VERSION}.tgz && cd bonnie++-${BONNIE_VERSION}/ && \
  ./configure && make && make install && \
  rm /tmp/bonnie++-${BONNIE_VERSION}.tgz && \
  rm -rf /tmp/bonnie++-${BONNIE_VERSION}/

# Build IOZone
RUN \
  cd /tmp && \
  wget http://www.iozone.org/src/current/iozone${IOZONE_VERSION}.tgz && \
  tar -xvf iozone${IOZONE_VERSION}.tgz && cd iozone${IOZONE_VERSION}/src/current/ && \
  make linux && cp iozone /usr/bin && \
  rm /tmp/iozone${IOZONE_VERSION}.tgz && \
  rm -rf /tmp/iozone${IOZONE_VERSION}/

RUN apt-get purge -y gcc make build-essential
RUN apt-get autoremove -y
RUN apt-get clean && rm -rf /var/lib/apt/lists/*

CMD /bin/bash
