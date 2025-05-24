#!/bin/bash

set -e  # Exit immediately on error
set -o pipefail

# Set the target path
KUBECTL_PATH="/usr/local/bin/kubectl"

# Check if kubectl is already installed
if [ -f "$KUBECTL_PATH" ]; then
    echo "kubectl is already installed at $KUBECTL_PATH."
else
    # Download kubectl
    echo "Downloading kubectl..."
    curl -O https://s3.us-west-2.amazonaws.com/amazon-eks/1.33.0/2025-05-01/bin/linux/amd64/kubectl

    # Make kubectl executable
    sudo chmod +x ./kubectl

    # Move kubectl to /usr/local/bin
    sudo mv ./kubectl /usr/local/bin/kubectl

    echo "kubectl installed successfully at $KUBECTL_PATH."
fi

# Set the target path for eksctl
EKSCTL_PATH="/usr/local/bin/eksctl"

# Check if eksctl is already installed
if [ -f "$EKSCTL_PATH" ]; then
    echo "eksctl is already installed at $EKSCTL_PATH."
else
    # Set platform details for eksctl download
    ARCH=amd64
    PLATFORM="$(uname -s)_$ARCH"

    # Download eksctl tar.gz
    echo "Downloading eksctl..."
    curl -sLO "https://github.com/eksctl-io/eksctl/releases/latest/download/eksctl_${PLATFORM}.tar.gz"

    # Extract and move eksctl
    tar -xzf eksctl_${PLATFORM}.tar.gz -C /tmp && rm eksctl_${PLATFORM}.tar.gz
    sudo mv /tmp/eksctl /usr/local/bin/eksctl

    echo "eksctl installed successfully at $EKSCTL_PATH."
fi

# Ensure /usr/local/bin is in the user's PATH
export PATH=$PATH:/usr/local/bin

# Verify kubectl version using sudo with updated PATH
echo "Verifying kubectl installation..."
sudo env "PATH=$PATH" kubectl version --client

# Verify eksctl version using sudo with updated PATH
echo "Verifying eksctl installation..."
sudo env "PATH=$PATH" eksctl version

