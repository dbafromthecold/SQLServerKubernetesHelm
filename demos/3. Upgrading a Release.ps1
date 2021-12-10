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



# install a specific version of the chart and change the sa password
helm install azure-sql-edge dbafromthecold/azure-sql-edge --version 1.0.0  --set saPassword="NewPassword1122"



# confirm release deployed
helm list



# confirm user supplied values
helm get values azure-sql-edge > values.txt
notepad values.txt



# view kubernetes objects
kubectl get all



# view service
kubectl get service



# get Azure SQL Edge version (1557)
IpAddress=$(kubectl get service sqledge-deployment --no-headers -o custom-columns=":status.loadBalancer.ingress[*].ip")
mssql-cli -S $IpAddress -U sa -P NewPassword1122 -Q "SELECT @@VERSION AS [Version];"



# view release
helm list --all



# view status
helm status azure-sql-edge



# upgrade the release
helm upgrade azure-sql-edge dbafromthecold/azure-sql-edge --version 1.1.0



# confirm release upgraded
helm list



# view history of release
helm history azure-sql-edge



# view kubernetes objects
kubectl get all



# get Azure SQL Edge version (1559)
IpAddress=$(kubectl get service sqledge-deployment --no-headers -o custom-columns=":status.loadBalancer.ingress[*].ip")
mssql-cli -S $IpAddress -U sa -P NewPassword1122 -Q "SELECT @@VERSION AS [Version];"
