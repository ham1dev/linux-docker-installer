#!/bin/bash

# Function to prompt for Docker Compose version
get_docker_compose_version() {
  read -p "Enter the Docker Compose version to install (default: latest): " compose_version
  compose_version=${compose_version:-latest}
}

# Function to install Docker Compose
install_docker_compose() {
  local version=$1

  if [ "$version" = "latest" ]; then
    version=$(curl -s https://api.github.com/repos/docker/compose/releases/latest | grep -Po '"tag_name": "\K.*?(?=")')
  fi

  # Ensure version starts with 'v'
  if [[ $version != v* ]]; then
    version="v$version"
  fi
  
  # Download Docker Compose binary
  sudo curl -L "https://github.com/docker/compose/releases/download/$version/docker-compose-$(uname -s | tr '[:upper:]' '[:lower:]')-$(uname -m)" -o /usr/local/bin/docker-compose

  # Apply executable permissions to the binary
  sudo chmod +x /usr/local/bin/docker-compose

  # Verify Docker Compose installation
  docker-compose --version

  echo "Docker Compose $version has been installed successfully."
}

# Main script
get_docker_compose_version
install_docker_compose $compose_version
