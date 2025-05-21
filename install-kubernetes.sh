#!/bin/bash

set -e  # Exit immediately on error
set -o pipefail

# Download kubectl
echo "Downloading kubectl..."
curl -O https://s3.us-west-2.amazonaws.com/amazon-eks/1.33.0/2025-05-01/bin/linux/amd64/kubectl

# Make kubectl executable
chmod +x ./kubectl

# Move kubectl to /usr/local/bin
sudo mv ./kubectl /usr/local/bin/kubectl
echo "kubectl installed at /usr/local/bin/kubectl"

# Verify kubectl installation
if ! command -v kubectl &> /dev/null; then
    echo "kubectl could not be installed correctly or is not in the PATH."
    exit 1
fi

echo "kubectl installed successfully."

# Verify kubectl version
kubectl version 

# Set platform details
ARCH=amd64
PLATFORM="$(uname -s)_$ARCH"

# Download eksctl tar.gz
echo "Downloading eksctl..."
curl -sLO "https://github.com/eksctl-io/eksctl/releases/latest/download/eksctl_${PLATFORM}.tar.gz"

# Extract and move eksctl
tar -xzf eksctl_$PLATFORM.tar.gz -C /tmp && rm eksctl_$PLATFORM.tar.gz
sudo mv eksctl /usr/local/bin/eksctl

echo "eksctl installed at /usr/local/bin/eksctl"

# Verify eksctl version
eksctl version

# Run AWS configure
echo "Running AWS configure..."
aws configure
