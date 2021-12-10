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
helm get manifest azure-sql-edge > manifests.txt
notepad manifests.txt



# get release values - no user values were supplied so file will be blank
helm get values azure-sql-edge > values.txt
notepad values.txt



# get release notes
helm get notes azure-sql-edge > notes.txt
notepad notes.txt



# get all from release
helm get all azure-sql-edge > all.txt
notepad all.txt



# view namespaces
kubectl get ns



# view kubernetes objects
kubectl get all -n azure-sql-edge



# view persistent volumes and persistent volume claims
kubectl get pvc -n azure-sql-edge
kubectl get pv



# view secret
kubectl get secrets -n azure-sql-edge



# connect to azure sql edge
IpAddress=$(kubectl get service sqledge-deployment -n azure-sql-edge --no-headers -o custom-columns=":status.loadBalancer.ingress[*].ip")
mssql-cli -S $IpAddress -U sa -P Testing1122 -Q "SELECT @@VERSION"



# view release history
helm history azure-sql-edge



# uninstall a release
helm uninstall azure-sql-edge --keep-history



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
kubectl get all