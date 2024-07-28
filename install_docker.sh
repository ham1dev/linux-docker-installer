#!/bin/bash

# Function to prompt for Docker version
get_docker_version() {
  read -p "Enter the Docker version to install (default: latest): " docker_version
  docker_version=${docker_version:-latest}
}

# Function to install Docker
install_docker() {
  local version=$1

  # Update the package database
  sudo apt-get update -y

  # Install prerequisite packages
  sudo apt-get install -y \
    apt-transport-https \
    ca-certificates \
    curl \
    gnupg-agent \
    software-properties-common

  # Add Docker's official GPG key
  curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg

  # Set up the stable repository
  echo \
    "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/ubuntu \
    $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null

  # Update the package database again
  sudo apt-get update -y

  # Install Docker
  if [ "$version" = "latest" ]; then
    sudo apt-get install -y docker-ce docker-ce-cli containerd.io
  else
    sudo apt-get install -y docker-ce=$version docker-ce-cli=$version containerd.io
  fi

  # Verify Docker installation
  sudo docker --version

  echo "Docker $version has been installed successfully."
}

# Main script
get_docker_version
install_docker $docker_version
