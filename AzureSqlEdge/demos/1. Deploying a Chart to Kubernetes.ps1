###################################################################################################
###################################################################################################
#
# https://github.com/dbafromthecold/SQLServerKubernetesHelm
# 
# Deploying a Chart to Kubernetes
#  
# Andrew Pruski
# @dbafromthecold
# www.dbafromthecold.com
# 
###################################################################################################
###################################################################################################



##################################################
# view yaml files for charts
##################################################



# jump into WSL
wsl --distribution Ubuntu-20.04



# navigage to work directory
mkdir helmdemos && cd helmdemos



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



# list helm repositories
helm repo list



# search repository for a azure-sql-edge chart
helm search repo dbafromthecold/azure-sql-edge



# search repository for a azure-sql-edge chart
helm search repo dbafromthecold/azure-sql-edge --versions



# show chart definition
helm show chart dbafromthecold/azure-sql-edge



# test deployment of chart
helm install azure-sql-edge dbafromthecold/azure-sql-edge --dry-run --debug



# deploy chart
helm install azure-sql-edge dbafromthecold/azure-sql-edge



# confirm deployment
helm list
