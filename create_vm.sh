#!/bin/bash

az group create --name myResourceGroup --location eastus #Create Resource Group

az vm create --resource-group myResourceGroup --name myVM --image UbuntuLTS --generate-ssh-keys #Create VM

#Return Example
#{
#  "fqdns": "",
#  "id": "/subscriptions/d5b9d4b7-6fc1-0000-0000-000000000000/resourceGroups/myResourceGroup/providers/Microsoft.Compute/virtualMachines/myVM",
#  "location": "eastus",
#  "macAddress": "00-0D-3A-23-9A-49",
#  "powerState": "VM running",
#  "privateIpAddress": "10.0.0.4",
#  "publicIpAddress": "40.68.254.142",
#  "resourceGroup": "myResourceGroup"
#}

az vm open-port --port 80 --resource-group myResourceGroup --name myVM #Open HHTP

#ssh <publicIpAddress> 

# update package source
#sudo apt-get -y update

# install NGINX
#sudo apt-get -y install nginx

#Test
#http://<publicIpAddress>

#Remove ResourceGroup(Tenant), and remove all resources
#az group delete --name myResourceGroup
