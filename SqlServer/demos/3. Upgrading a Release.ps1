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
helm search repo dbafromthecold/sqlserver



# search the stable repository for a chart and retrieve the different versions (2 in the repo)
helm search repo dbafromthecold/sqlserver --versions



# test installing a specific version of the chart
helm install sqlserver dbafromthecold/sqlserver --version 1.0.0 --dry-run --debug



# install a specific version of the chart
helm install sqlserver dbafromthecold/sqlserver --version 1.0.0



# confirm release deployed
helm list



# view namespace
kubectl get ns



# view secret
kubectl get secrets -n sqlserver



# get persistent volumes and persistent volume claims
kubectl get pv && kubectl get pvc -n sqlserver



# view kubernetes objects
kubectl get all -n sqlserver



# view pod events
kubectl describe pod -n sqlserver



# view service
kubectl get service -n sqlserver



# get sql server version
#IpAddress=$(kubectl get service sqlserver-service -n sqlserver --no-headers -o custom-columns=":status.loadBalancer.ingress[*].ip") && echo $IpAddress
IpAddress=$(kubectl get service sqlserver-service -n sqlserver --no-headers -o custom-columns=":status.loadBalancer.ingress[*].hostname") && echo $IpAddress
mssql-cli -S $IpAddress -U sa -P Testing1122 -Q "SELECT @@VERSION AS [Version];"



# view release
helm list --all



# view status
helm status sqlserver



# upgrade the release
helm upgrade sqlserver dbafromthecold/sqlserver --version 2.0.0



# confirm release upgraded
helm list



# view status
helm status sqlserver



# view history of release
helm history sqlserver



# view kubernetes objects
kubectl get all -n sqlserver



# view pod events
kubectl describe pod -n sqlserver



# view the container image in the deployment
kubectl get deployment -n sqlserver -o jsonpath='{ .items[*].spec.template.spec.containers[*].image }' && echo ""



# view pod logs
kubectl logs -n sqlserver $(kubectl get pod -l app=sqlserver -n sqlserver -o jsonpath='{ .items[*].metadata.name }')



# get SQL Server version
#IpAddress=$(kubectl get service sqlserver-service -n sqlserver --no-headers -o custom-columns=":status.loadBalancer.ingress[*].ip") && echo $IpAddress
IpAddress=$(kubectl get service sqlserver-service -n sqlserver --no-headers -o custom-columns=":status.loadBalancer.ingress[*].hostname") && echo $IpAddress
mssql-cli -S $IpAddress -U sa -P Testing1122 -Q "SELECT @@VERSION AS [Version];"