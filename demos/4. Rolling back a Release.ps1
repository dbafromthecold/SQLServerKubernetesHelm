###################################################################################################
###################################################################################################
#
# https://github.com/dbafromthecold/SQLServerKubernetesHelm
# 
# Rolling back a release
#  
# Andrew Pruski
# 
###################################################################################################
###################################################################################################



# view release
helm list



# view release history
helm history azure-sql-edge



# view kubernetes objects
kubectl get all



# view replicasets
kubectl get replicasets



# rollback release
helm rollback azure-sql-edge 1



# view release history
helm history azure-sql-edge



# view kubernetes objects
kubectl get all



# view replicasets
kubectl get replicasets



###################################################################################################
# Rolling back without the old replicaset
###################################################################################################



# clean up previous release
helm delete azure-sql-edge



# deploy specific version of chart
helm install azure-sql-edge dbafromthecold/azure-sql-edge --version 1.0.0



# upgrade release
helm upgrade azure-sql-edge dbafromthecold/azure-sql-edge --version 1.1.0



# confirm history
helm history azure-sql-edge



# view kubernetes objects
kubectl get all



# view replicasets
kubectl get replicaset



# get oldest replicaset
replicaSet=$(kubectl get replicaset --sort-by='{.metadata.creationTimestamp}' --no-headers | head -1 | awk '{print $1}') && echo $replicaSet


# delete old replicaset - replace NAME with the old replicaset name
kubectl delete replicaset $replicaSet



# confirm deletion
kubectl get replicaset



# try a rollback with kubectl - will fail as we have deleted the old replicaset
kubectl rollout undo deployment/sqledge-deployment



# but we still have the history of the release in Helm
helm history azure-sql-edge



# rollback with helm
helm rollback azure-sql-edge 1



# confirm status of release
helm list



# confirm rollback
helm history azure-sql-edge



# view replicaset
kubectl get replicaset



# the old replicaset is back!
echo $replicaSet



# this is due to the release history being stored as secrets in the k8s cluster
kubectl get secrets



# let's a look at one of those secrets
kubectl get secret sh.helm.release.v1.azure-sql-edge.v1 -o yaml



# the secret is encoded. For further information on decoding these secrets, see here: -
# https://dbafromthecold.com/2020/08/10/decoding-helm-secrets/ 



kubectl get secret sh.helm.release.v1.azure-sql-edge.v1 \
-o jsonpath="{ .data.release }" | base64 -d | base64 -d | gunzip -c | jq '.chart.templates[].data' | tr -d '"' | base64 -d