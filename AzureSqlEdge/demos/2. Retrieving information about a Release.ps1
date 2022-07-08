###################################################################################################
###################################################################################################
#
# https://github.com/dbafromthecold/SQLServerKubernetesHelm
# 
# Retrieving information about a release
#  
# Andrew Pruski
# @dbafromthecold
# www.dbafromthecold.com
# 
###################################################################################################
###################################################################################################



# view deployments
helm list



# view status of release
helm status azure-sql-edge



# get release manifests
helm get manifest azure-sql-edge | code -



# get release notes
helm get notes azure-sql-edge | code -



# get all from release
helm get all azure-sql-edge | code -



# view namespaces
kubectl get ns



# view kubernetes objects
kubectl get all -n azure-sql-edge



# view persistent volumes and persistent volume claims
kubectl get pvc -n azure-sql-edge && kubectl get pv



# view secret
kubectl get secrets -n azure-sql-edge



# decode secret
kubectl get secret azure-sql-edge-sa-secret -n azure-sql-edge -o custom-columns=":data.MSSQL_SA_PASSWORD" | base64 -d && echo ""



# connect to azure sql edge
IpAddress=$(kubectl get service sqledge-deployment -n azure-sql-edge --no-headers -o custom-columns=":status.loadBalancer.ingress[*].ip") && echo $IpAddress
mssql-cli -S $IpAddress -U sa -P Testing1122 -Q "SELECT @@VERSION AS [Version];"



# view release history
helm history azure-sql-edge



# uninstall a release
helm uninstall azure-sql-edge --keep-history



# view release history
helm history azure-sql-edge



# confirm
helm list



# confirm with --all flag
helm list --all



# view objects
kubectl get all -n azure-sql-edge



# delete release
helm delete azure-sql-edge



# confirm with --all flag
helm list --all



# confirm deployment deleted
kubectl get all -n azure-sql-edge
