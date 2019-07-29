#!/bin/bash

# Set a default mahine name
MACHINE_PREFIX=$1
if [ -z $MACHINE_PREFIX ] 
    then
        MACHINE_PREFIX="Swarm"
fi

# List machines
docker-machine ls

# Setup swarm cluster
echo ""
echo ""
# Initialize  leader
docker-machine ssh "${MACHINE_PREFIX}-1" docker swarm init --advertise-addr $(docker-machine ip ${MACHINE_PREFIX}-1)

# Get the join command to apply to others cluster machines
JOIN_COMMAND=$(docker-machine ssh "${MACHINE_PREFIX}-1" docker swarm join-token manager | grep "docker swarm")

# Create swarm workers
for server in {2..3}; do
docker-machine ssh ${MACHINE_PREFIX}-${server} $JOIN_COMMAND
done
echo ""
echo ""

# List all swarm nodes
docker-machine ssh "${MACHINE_PREFIX}-1" docker node ls