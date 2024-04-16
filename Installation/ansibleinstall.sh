#!/bin/bash

# Update package index
sudo dnf update -y

# Install EPEL repository (Extra Packages for Enterprise Linux)
sudo dnf install epel-release -y

# Install Ansible
sudo dnf install ansible -y

# Check Ansible version
ansible --version

# Display installation status
if [ $? -eq 0 ]; then
    echo "Ansible installation completed successfully."
else
    echo "Error: Ansible installation failed."
fi
