#!/bin/bash

# Ubuntu Server created with static IP
ID_USERNAME='nan'
ID_HOSTNAME='ubox'

# Add Key in SSH
ID_RSA_PUB='../keys/mypubkey.pem'
ID_RSA_PRI='../keys/myprivkey.pem'
cat ${ID_RSA_PUB} | ssh ${ID_USERNAME}@${ID_HOSTNAME} "mkdir -p ~/.ssh && touch ~/.ssh/authorized_keys && chmod -R go= ~/.ssh && cat >> ~/.ssh/authorized_keys"

# Push Install script
INSTALL_SCRIPT='install_tools.sh'
scp -i ${ID_RSA_PRI} ${INSTALL_SCRIPT} ${ID_USERNAME}@${ID_HOSTNAME}:. 

# Ensure internet gateway is setup 
ssh ${ID_USERNAME}@${ID_HOSTNAME} -i ${ID_RSA_PRI} "ping -c 2 www.google.com"

# If ping command is wrong, delete additional gateway, setup default 
# ip route show
# sudo ip route delete default via XX.XX.XX.XX
# sudo ip route add default via XX.XX.XX.XX 

