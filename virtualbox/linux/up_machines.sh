#!/bin/bash

# Set a default mahine name
MACHINE_PREFIX=$1
if [ -z $MACHINE_PREFIX ] 
    then
        MACHINE_PREFIX="Swarm"
fi

echo $MACHINE_PREFIX
# SetUp machines
docker-machine ls
echo ""
echo ""

# Create 
for server in {1..3}; do
    echo | docker-machine create  \
        --driver=virtualbox  \
        "${MACHINE_PREFIX}-${server}" &
done
docker-machine ls
echo ""
echo ""




