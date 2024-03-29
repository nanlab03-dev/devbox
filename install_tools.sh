#!/bin/bash

# Update Ubuntu
sudo apt-get update

# Install Python
sudo apt-get install -y python3-pip git unzip

# Install Monitoring Tools
sudo apt-get install -y net-tools sysstat vnstat iotop iftop bwm-ng htop munin 

# Install Other tools
sudo apt-get install -y vim psutil

# Install Glances
# (Taken from https://github.com/nicolargo/glances)
curl -L https://bit.ly/glances | sudo /bin/bash

# Install Azure CLI
# (Taken from https://docs.microsoft.com/en-us/cli/azure/install-azure-cli-linux?pivots=apt)
curl -sL https://aka.ms/InstallAzureCLIDeb | sudo bash

# Install Docker CE
# (Taken from https://docs.docker.com/engine/install/ubuntu/#install-using-the-convenience-script)
curl -fsSL https://get.docker.com -o get-docker.sh
sudo sh get-docker.sh

# Add current user to docker group
# (Taken from https://docs.docker.com/engine/install/linux-postinstall/#manage-docker-as-a-non-root-user)
sudo usermod -aG docker $USER

# Install Google Cloud SDK
echo "deb [signed-by=/usr/share/keyrings/cloud.google.gpg] https://packages.cloud.google.com/apt cloud-sdk main" | sudo tee -a /etc/apt/sources.list.d/google-cloud-sdk.list
sudo apt-get -y install apt-transport-https ca-certificates gnupg
curl https://packages.cloud.google.com/apt/doc/apt-key.gpg | sudo apt-key --keyring /usr/share/keyrings/cloud.google.gpg add -
sudo apt-get update && sudo apt-get install -y google-cloud-sdk

# Install AWS CLI
curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip"
unzip awscliv2.zip
sudo ./aws/install

# Install helm
# (Taken from https://helm.sh/docs/intro/install/#from-apt-debianubuntu)
curl https://baltocdn.com/helm/signing.asc | sudo apt-key add -
sudo apt-get install apt-transport-https --yes
echo "deb https://baltocdn.com/helm/stable/debian/ all main" | sudo tee /etc/apt/sources.list.d/helm-stable-debian.list
sudo apt-get update
sudo apt-get install -y helm

# Install Terraform
curl -fsSL https://apt.releases.hashicorp.com/gpg | sudo apt-key add -
sudo apt-add-repository "deb [arch=$(dpkg --print-architecture)] https://apt.releases.hashicorp.com $(lsb_release -cs) main"
sudo apt install terraform --yes

# SNAPS
# Install VS Code
sudo snap install --classic code

# Install kubectl
sudo snap install --classic kubectl 

# Configure with Azure AKS
# az login
# az aks get-credentials --resource-group NAN-rg --name NAN-Lab-K8S
# echo 'source <(kubectl completion bash)' >>~/.bashrc
# source .bashrc




