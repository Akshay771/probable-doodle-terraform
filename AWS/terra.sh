#!/bin/bash

# Apply Terraform configuration
terraform apply -auto-approve

# Capture instance public IPs to public_ips.txt
terraform output instance_public_ips > public_ips.txt

# Read IP addresses from public_ips.txt
ips=($(grep -oE '[0-9]+\.[0-9]+\.[0-9]+\.[0-9]+' public_ips.txt))

# Loop through the array and process each IP address
for ip in "${ips[@]}"; do
  echo "Processing IP address: $ip"
  # Add your processing logic here
  ssh -o StrictHostKeyChecking=no -i id_rsa ubuntu@$ip 'bash -s' < script.sh
done
