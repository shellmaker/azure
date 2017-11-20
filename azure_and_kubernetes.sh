#!/bin/bash

  #Finalidade : Criar Cluster Kubernetes no Azure
  #Autor  : Marcos de Benedicto
  
az group create --name myResourceGroup --location westeurope #Criar um grupo de recursos

az acs create --orchestrator-type kubernetes --resource-group myResourceGroup --name myK8sCluster --generate-ssh-keys #Criar cluster Kubernetes

az acs kubernetes get-credentials --resource-group=myResourceGroup --name=myK8sCluster #Conectar-se ao cluster

kubectl get nodes

echo "apiVersion: apps/v1beta1
kind: Deployment
metadata:
  name: azure-vote-back
spec:
  replicas: 1
  template:
    metadata:
      labels:
        app: azure-vote-back
    spec:
      containers:
      - name: azure-vote-back
        image: redis
        ports:
        - containerPort: 6379
          name: redis
---
apiVersion: v1
kind: Service
metadata:
  name: azure-vote-back
spec:
  ports:
  - port: 6379
  selector:
    app: azure-vote-back
---
apiVersion: apps/v1beta1
kind: Deployment
metadata:
  name: azure-vote-front
spec:
  replicas: 1
  template:
    metadata:
      labels:
        app: azure-vote-front
    spec:
      containers:
      - name: azure-vote-front
        image: microsoft/azure-vote-front:redis-v1
        ports:
        - containerPort: 80
        env:
        - name: REDIS
          value: "azure-vote-back"
---
apiVersion: v1
kind: Service
metadata:
  name: azure-vote-front
spec:
  type: LoadBalancer
  ports:
  - port: 80
  selector:
    app: azure-vote-front" >azure-vote.yml
    
kubectl create -f azure-vote.yml #Executar APP

kubectl get service azure-vote-front --watch #Testar APP
