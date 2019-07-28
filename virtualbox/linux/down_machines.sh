#!/bin/bash

# Set a default mahine name
MACHINE_PREFIX=$1
if [ -z $MACHINE_PREFIX ] 
    then
        MACHINE_PREFIX="Swarm"
fi


docker-machine ls

for server in {1..3}; do
    echo "y" | docker-machine rm "$MACHINE_PREFIX-$server"
done

docker-machine ls
echo ""
echo ""