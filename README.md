# Timesys Factory Container

This container builds an Ubuntu 18.0.4 environment necessary to build a Timesys factory project in a local shared filesystem on the host.

First you should download the Timesys Factory and `cd` to that folder.

## To run on Linux (tested)

docker run --network="host" -it --rm -v $(pwd):/home/worker/build:rw -v ${HOME}/.ssh:/home/worker/.ssh:ro oaklabs/timesys-factory-container:release-1.3

## To run on MacOS (tested)

docker run --network="host" -it --rm -v $(pwd):/home/worker/build:rw,delegated -v ${HOME}/.ssh:/home/worker/.ssh:ro oaklabs/timesys-factory-container:release-1.3

## To run on Windows (not tested)

docker run --network="host" -it --rm -v %cd%:/home/worker/build:rw,delegated -v %HOMEDRIVE%%HOMEPATH%/.ssh:/home/worker/.ssh:ro oaklabs/timesys-factory-container:release-1.3

## Running with Docker Compose and NFS

The read/write on Mac and Windows is not as fast to run as Linux, which has native file translation. There is a noticable performance difference using a shared NFS volume on Mac and Windows. If you are having these kinds of issues, you might try this fileshare type.

``` yaml
---
version: '3'

services:
  factory-container:
    image: oaklabs/timesys-factory-container:release-1.3
    tty: true
    volumes:
      - nfsmount:/home/worker/build:rw
      - "${HOME}/.ssh:/home/worker/.ssh:ro"

volumes:
  nfsmount:
    driver: local
    driver_opts:
      type: nfs
      o: addr=host.docker.internal,rw,nolock,hard,nointr,nfsvers=3
      device: ":${PWD}"
```
