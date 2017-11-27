az group create -l westus -n MyRG

#az group delete -n MyRG						#DELETE RG
#az group export -n MyRG > ./MyTemplate.json 	#Export ARM

# Using DCOS - default
az vm container create -g MyRG -n ACS1 --dns-name-prefix acsdemo

# Using Docker Swarm
az vm container create -g MyRG -n ACS1 --dns-name-prefix acsdemo --orchestrator-type Swarm

# Use SSH into jumpbox and use Swarm or DCOS (Mesos, Marathon) tooling
