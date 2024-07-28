#!/bin/bash

# Uninstall Docker, Docker CLI, and containerd
sudo apt-get purge -y docker-ce docker-ce-cli containerd.io

# Remove Docker directories
sudo rm -rf /var/lib/docker
sudo rm -rf /var/lib/containerd

# Remove Docker group
sudo groupdel docker

# Optionally, remove Docker-related configuration files
sudo rm -rf /etc/docker
sudo rm -rf ~/.docker

echo "Docker has been removed from the system."
