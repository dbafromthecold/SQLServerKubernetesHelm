###################################################################################################
###################################################################################################
#
# https://github.com/dbafromthecold/SQLServerKubernetesHelm
# 
# Upgrading a release
#  
# Andrew Pruski
# @dbafromthecold
# www.dbafromthecold.com
# 
###################################################################################################
###################################################################################################



# search the repository for a chart
helm search repo dbafromthecold/azure-sql-edge



# search the stable repository for a chart and retrieve the different versions (2 in the repo)
helm search repo dbafromthecold/azure-sql-edge --versions



# test installing a specific version of the chart
helm install azure-sql-edge dbafromthecold/azure-sql-edge --version 1.0.0 --dry-run --debug



# install a specific version of the chart
helm install azure-sql-edge dbafromthecold/azure-sql-edge --version 1.0.0



# confirm release deployed
helm list



# view namespace
kubectl get ns



# view secret
kubectl get secrets -n azure-sql-edge



# get persistent volumes and persistent volume claims
kubectl get pv && kubectl get pvc -n azure-sql-edge



# view kubernetes objects
kubectl get all -n azure-sql-edge



# view service
kubectl get service -n azure-sql-edge



# get Azure SQL Edge version (1557)
IpAddress=$(kubectl get service sqledge-deployment -n azure-sql-edge --no-headers -o custom-columns=":status.loadBalancer.ingress[*].ip") && echo $IpAddress
mssql-cli -S $IpAddress -U sa -P Testing1122 -Q "SELECT @@VERSION AS [Version];"



# view release
helm list --all



# view status
helm status azure-sql-edge



# upgrade the release
helm upgrade azure-sql-edge dbafromthecold/azure-sql-edge --version 1.1.0



# confirm release upgraded
helm list



# view status
helm status azure-sql-edge



# view history of release
helm history azure-sql-edge



# view kubernetes objects
kubectl get all -n azure-sql-edge



# view the container image in the deployment
kubectl get deployment -n azure-sql-edge -o jsonpath='{ .items[*].spec.template.spec.containers[*].image }' && echo ""



# get Azure SQL Edge version (1559)
IpAddress=$(kubectl get service sqledge-deployment -n azure-sql-edge --no-headers -o custom-columns=":status.loadBalancer.ingress[*].ip")
mssql-cli -S $IpAddress -U sa -P Testing1122 -Q "SELECT @@VERSION AS [Version];"
