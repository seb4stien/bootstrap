#!/bin/bash

set -euo pipefail

VM_NAME="${1:-dev-vm}"

echo "Creating multipass VM: $VM_NAME"

multipass launch \
  --name "$VM_NAME" \
  --cloud-init cloud-init.yaml \
  --cpus 2 \
  --memory 16G \
  --disk 20G \
  --timeout 600

echo "Stopping VM $VM_NAME"
multipass stop "$VM_NAME"

multipass mount \
  --type native \
  ~/work \
  $VM_NAME:~/work \

echo "VM $VM_NAME created and stopped successfully"
multipass info "$VM_NAME"
