###################################################################################################
###################################################################################################
#
# https://github.com/dbafromthecold/SQLServerKubernetesHelm
# 
# Retrieving information about a release
#  
# Andrew Pruski
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



# view kubernetes objects
kubectl get all



# view release history
helm history azure-sql-edge



# uninstall a release
helm uninstall azure-sql-edge --keep-history



# confirm
helm list



# confirm with --all flag
helm list --all



# delete release
helm delete azure-sql-edge



# confirm with --all flag
helm list --all



# confirm deployment deleted
kubectl get all