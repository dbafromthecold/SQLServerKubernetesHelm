###################################################################################################
###################################################################################################
#
# https://github.com/dbafromthecold/SQLServerKubernetesHelm
# 
# Upgrading a release
#  
# Andrew Pruski
# 
###################################################################################################
###################################################################################################



# search the repository for a chart
helm search repo dbafromthecold/azure-sql-edge



# search the stable repository for a chart and retrieve the different versions (2 in the repo)
helm search repo dbafromthecold/azure-sql-edge --versions



# install a specific version of the chart
helm install mysql dbafromthecold/azure-sql-edge --version 1.0.0



# confirm release deployed
helm list



# view kubernetes objects
kubectl get all



# upgrade the release
helm upgrade mysql dbafromthecold/azure-sql-edge --version 1.1.0



# confirm release upgraded
helm list



# view history of release
helm history mysql



# view kubernetes objects
kubectl get all
