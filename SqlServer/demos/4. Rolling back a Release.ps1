###################################################################################################
###################################################################################################
#
# https://github.com/dbafromthecold/SQLServerKubernetesHelm
# 
# Rolling back a release
#  
# Andrew Pruski
# @dbafromthecold
# www.dbafromthecold.com
# 
###################################################################################################
###################################################################################################



# view release
helm list



# view release history
helm history sqlserver



# view kubernetes objects
kubectl get all -n sqlserver



# view replicasets
kubectl get replicasets -n sqlserver



# rollback release
helm rollback sqlserver 1



# view release history
helm history sqlserver



# view kubernetes objects
kubectl get all -n sqlserver



# view replicasets
kubectl get replicasets -n sqlserver



# view the container image in the deployment
kubectl get deployment -n sqlserver -o jsonpath='{ .items[*].spec.template.spec.containers[*].image }' && echo ""



# get Azure SQL Edge version (1557)
IpAddress=$(kubectl get service sqledge-deployment -n sqlserver --no-headers -o custom-columns=":status.loadBalancer.ingress[*].ip") && echo $IpAddress
mssql-cli -S $IpAddress -U sa -P Testing1122 -Q "SELECT @@VERSION AS [Version];"



###################################################################################################
# Rolling back without the old replicaset
###################################################################################################



# clean up previous release
helm delete sqlserver



# confirm deletion
helm list --all



# view kubernetes objects
kubectl get all -n sqlserver



# deploy specific version of chart
helm install sqlserver dbafromthecold/sqlserver --version 1.0.0



# upgrade release
helm upgrade sqlserver dbafromthecold/sqlserver --version 1.1.0



# confirm history
helm history sqlserver



# view kubernetes objects
kubectl get all -n sqlserver



# view replicasets
kubectl get replicaset -n sqlserver



# get oldest replicaset
replicaSet=$(kubectl get replicaset -n sqlserver --sort-by='{.metadata.creationTimestamp}' --no-headers | head -1 | awk '{print $1}') && echo $replicaSet



# delete old replicaset
kubectl delete replicaset $replicaSet -n sqlserver



# confirm deletion
kubectl get replicaset -n sqlserver



# view history using kubectl
kubectl rollout history deployment sqledge-deployment  -n sqlserver



# try a rollback with kubectl - will fail as we have deleted the old replicaset
kubectl rollout undo deployment/sqledge-deployment -n sqlserver



# but we still have the history of the release in Helm
helm history sqlserver



# rollback with helm
helm rollback sqlserver 1



# confirm status of release
helm list



# confirm rollback
helm history sqlserver



# view all kubernetes objects
kubectl get all -n sqlserver



# view the container image in the deployment
kubectl get deployment -n sqlserver -o jsonpath='{ .items[*].spec.template.spec.containers[*].image }' && echo ""



# view replicaset
kubectl get replicaset -n sqlserver



# the old replicaset is back!
echo $replicaSet



# this is due to the release history being stored as secrets in the k8s cluster
kubectl get secrets



# let's a look at one of those secrets
kubectl get secret sh.helm.release.v1.sqlserver.v1 -o yaml



# the secret is encoded. For further information on decoding these secrets, see here: -
# https://dbafromthecold.com/2020/08/10/decoding-helm-secrets/ 



kubectl get secret sh.helm.release.v1.sqlserver.v1 \
-o jsonpath="{ .data.release }" | base64 -d | base64 -d | gunzip -c | jq '.chart.templates[].data' | tr -d '"' | base64 -d | code -



# clean up
helm delete sqlserver
