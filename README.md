# Timesys Factory Container

This container builds an Ubuntu 18.0.4 environment necessary to build a Timesys factory project in a local shared filesystem on the host.

First you should download the Timesys Factory and `cd` to that folder.

## To run on Linux

docker run --network="host" -it --rm -v $(pwd):/home/worker/build:rw -v ${HOME}/.ssh:/home/worker/.ssh:ro oaklabs/timesys-factory-container:release-1.0

## To run on MacOS

docker run --network="host" -it --rm -v $(pwd):/home/worker/build:rw,delegated -v ${HOME}/.ssh:/home/worker/.ssh:ro oaklabs/timesys-factory-container:release-1.0

## To run on Windows

docker run --network="host" -it --rm -v %cd%:/home/worker/build:rw,delegated -v %HOMEDRIVE%%HOMEPATH%/.ssh:/home/worker/.ssh:ro oaklabs/timesys-factory-container:release-1.0
