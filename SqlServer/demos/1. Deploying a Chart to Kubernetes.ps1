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



# navigate to work directory
mkdir helmdemos && cd helmdemos



# confirm current context
kubectl config current-context



# switch context if needed
#kubectl config use-context kubernetes1
kubectl config use-context docker-desktop


# test connection to cluster
kubectl get nodes



# list helm repositories
helm repo list



# add repository
helm repo add dbafromthecold https://raw.githubusercontent.com/dbafromthecold/SQLServerKubernetesHelm/main/SqlServer



# list helm repositories
helm repo list



# search repository for a sqlserver chart
helm search repo dbafromthecold/sqlserver



# search repository for a sqlserver chart
helm search repo dbafromthecold/sqlserver --versions



# show chart definition
helm show chart dbafromthecold/sqlserver



# test deployment of chart
helm install sqlserver dbafromthecold/sqlserver --dry-run --debug



# deploy chart
helm install sqlserver dbafromthecold/sqlserver



# confirm deployment
helm list
