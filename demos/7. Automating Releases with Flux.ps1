###################################################################################################
###################################################################################################
#
# https://github.com/dbafromthecold/SQLServerKubernetesHelm
# 
# Using flux to automate deployments to Kubernetes
# https://fluxcd.io/docs/guides/helmreleases/
#  
# Andrew Pruski
# @dbafromthecold
# www.dbafromthecold.com
# 
###################################################################################################
###################################################################################################



# install flux
curl -s https://fluxcd.io/install.sh | sudo bash



# confirm pre-requisites
flux check --pre



# boot strap the cluster
flux bootstrap git \
  --url=https://github.com/dbafromthecold/DemoHelmRepo \
  --username=dbafromthecold \
  --password=XXXXXXXXXXXXXXXXXXXXX \
  --token-auth=true \
  --path=clusters/raspberrypi



# create Helm Repository resource
echo 'apiVersion: source.toolkit.fluxcd.io/v1beta1
kind: HelmRepository
metadata:
  name: helmrepo
  namespace: flux-system
spec:
  interval: 1m
  url: https://raw.githubusercontent.com/dbafromthecold/DemoHelmRepo/main' | kubectl apply -f - 



# view resource
kubectl get HelmRepository -n flux-system



# create Helm Release resource
echo 'apiVersion: helm.toolkit.fluxcd.io/v2beta1
kind: HelmRelease
metadata:
  name: azure-sql-edge
  namespace: default
spec:
  interval: 1m
  chart:
    spec:
      chart: azure-sql-edge
      version: ''0.0.0 - 2.0.0''
      sourceRef:
        kind: HelmRepository
        name: helmrepo
        namespace: flux-system
      interval: 1m
  values:
    replicaCount: 1' | kubectl apply -f -



# view resource
kubectl get HelmRelease



# copy chart into repository
cp /mnt/c/git/dbafromthecold/SQLServerKubernetesHelm/azure-sql-edge-1.0.0.tgz .



# index repository
helm repo index .



# view files in repo
ls -al


# push chart to repo
git add .
git commit -m "updated repo"
git push



# confirm release deployed
helm list



# view history
helm history azure-sql-edge



# view kubernetes objects
kubectl get all



# connect to SQL
IpAddress=$(kubectl get service sqledge-deployment --no-headers -o custom-columns=":status.loadBalancer.ingress[*].ip")
mssql-cli -S $IpAddress -U sa -P Testing1122 -Q "SELECT @@VERSION AS [Version];"



# copy new chart into repository
cp /mnt/c/git/dbafromthecold/SQLServerKubernetesHelm/azure-sql-edge-1.1.0.tgz .



# re-index repository
helm repo index .



# view index.yaml
cat index.yaml



# push new chart to repository
git status
git add .
git commit -m "added new chart"
git push



# list releases
helm list



# view history
helm history azure-sql-edge



# view kubernetes objects
kubectl get all



# connect to SQL
IpAddress=$(kubectl get service sqledge-deployment --no-headers -o custom-columns=":status.loadBalancer.ingress[*].ip")
mssql-cli -S $IpAddress -U sa -P Testing1122 -Q "SELECT @@VERSION AS [Version];"



# clean up
kubectl delete helmrelease azure-sql-edge
kubectl delete HelmRepository helmrepo -n flux-system
rm azure-sql-edge* index.yaml
git add .
git commit -m "cleaned demo repo"
git push
