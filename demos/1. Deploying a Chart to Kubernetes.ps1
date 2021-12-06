###################################################################################################
###################################################################################################
#
# https://github.com/dbafromthecold/SQLServerKubernetesHelm
# 
# Deploying a Chart to Kubernetes
#  
# Andrew Pruski
# 
###################################################################################################
###################################################################################################



# confirm current context
kubectl config current-context



# switch context if needed
kubectl config use-context raspberrypi



# test connection to cluster
kubectl get nodes



# list helm repositories
helm repo list



# add repository
helm repo add dbafromthecold https://raw.githubusercontent.com/dbafromthecold/SQLServerKubernetesHelm/main/



# search repository for a azuresqledge chart
helm search repo dbafromthecold/azure-sql-edge --versions



# show chart definition
helm show chart dbafromthecold/azuresqledge



# show chart README
helm show readme dbafromthecold/azuresqledge



# pipe README to file
helm show readme dbafromthecold/azuresqledge > C:\Temp\README.txt



# show chart values
helm show values dbafromthecold/azuresqledge > C:\Temp\values.txt



# test deployment of chart
helm install azuresqledge dbafromthecold/azuresqledge --dry-run --debug



# deploy chart
helm install azuresqledge dbafromthecold/azuresqledge



# confirm deployment
helm list
