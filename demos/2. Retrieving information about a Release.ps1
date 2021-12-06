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
helm status azuresqledge



# get release manifests
helm get manifest azuresqledge > C:\Temp\manifests.txt



# get release values - no user values were supplied so file will be blank
helm get values azuresqledge > C:\Temp\values.txt



# get release notes
helm get notes azuresqledge > C:\Temp\notes.txt



# get all from release
helm get all azuresqledge  > C:\Temp\all.txt



# view kubernetes objects
kubectl get all




# view release history
helm history azuresqledge



# uninstall a release
helm uninstall azuresqledge --keep-history



# confirm
helm list



# confirm with --all flag
helm list --all



# delete release
helm delete azure-sql-edge



# confirm with --all flag
helm list --all