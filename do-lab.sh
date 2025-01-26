#!/usr/bin/bash
echo "Starting the lab below..."

# INCLUDE ALL COMMANDS NEEDED TO PERFORM THE LAB
# This file will get called from capture_submission.sh

#1. Create a Bridge.
#2. Connect the interfaces frin 4node-part1.clab.yml to the bridge.

#!/bin/bash

# Create a bridge
sudo brctl addbr mybridge

# Bring the bridge up
sudo ip link set dev mybridge up

# Connect host interfaces to the bridge
sudo ip link set dev clab-lab1-part1-host1-eth1 master mybridge
sudo ip link set dev clab-lab1-part1-host2-eth1 master mybridge
sudo ip link set dev clab-lab1-part1-host3-eth1 master mybridge
sudo ip link set dev clab-lab1-part1-host4-eth1 master mybridge

# Bring up the host interfaces
sudo ip link set dev clab-lab1-part1-host1-eth1 up
sudo ip link set dev clab-lab1-part1-host2-eth1 up
sudo ip link set dev clab-lab1-part1-host3-eth1 up
sudo ip link set dev clab-lab1-part1-host4-eth1 up

#save and make it work
chmod +x do-lab.sh


#Validate My Setup
sudo containerlab deploy -t 4node-part1.clab.yml

#verify the bridge
brctl show mybridge

#check interfaces 
ip link show

#Test packet transmission: Use onepkt.py to send packets between hosts
docker exec clab-lab1-part1-host1 /lab-folder/onepkt.py host1 host2 test-pkt1

#Destroy the topology to clean up
sudo containerlab destroy -t 4node-part1.clab.yml

# Submit the lab 
./lab1/part1/lab-host1/provided/capture_submission.sh

