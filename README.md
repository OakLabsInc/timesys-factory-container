docker run --network="host" -it --rm -v $(pwd):/home/worker/build:rw -v ${HOME}/.ssh:/home/worker/.ssh:ro vfi/timesys-factory-container:release-1.0
