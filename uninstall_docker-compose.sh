#!/bin/bash

# Remove Docker Compose binary
sudo rm -f /usr/local/bin/docker-compose

# Optionally, remove Docker Compose configuration files
sudo rm -rf ~/.docker/compose

echo "Docker Compose has been removed from the system."
