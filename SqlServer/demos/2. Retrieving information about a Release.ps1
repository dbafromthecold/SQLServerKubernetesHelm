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
helm status sqlserver



# get release manifests
helm get manifest sqlserver | code -



# get release notes
helm get notes sqlserver | code -



# get all from release
helm get all sqlserver | code -



# view namespaces
kubectl get ns



# view kubernetes objects
kubectl get all -n sqlserver



# get pod events
kubectl describe pod -n sqlserver



# view persistent volumes and persistent volume claims
kubectl get pvc -n sqlserver && kubectl get pv



# view secret
kubectl get secrets -n sqlserver



# decode secret
kubectl get secret sqlserver-sa-secret -n sqlserver -o custom-columns=":data.MSSQL_SA_PASSWORD" | base64 -d && echo ""



# connect to sql server
#IpAddress=$(kubectl get service sqlserver-service -n sqlserver --no-headers -o custom-columns=":status.loadBalancer.ingress[*].ip") && echo $IpAddress
IpAddress=$(kubectl get service sqlserver-service -n sqlserver --no-headers -o custom-columns=":status.loadBalancer.ingress[*].hostname") && echo $IpAddress
mssql-cli -S $IpAddress -U sa -P Testing1122 -Q "SELECT @@VERSION AS [Version];"



# view release history
helm history sqlserver



# uninstall a release
helm uninstall sqlserver --keep-history



# view release history
helm history sqlserver



# confirm
helm list



# confirm with --all flag
helm list --all



# view objects
kubectl get all -n sqlserver



# delete release
helm delete sqlserver



# confirm with --all flag
helm list --all



# confirm deployment deleted
kubectl get all -n sqlserver
