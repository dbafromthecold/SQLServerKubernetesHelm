###################################################################################################
###################################################################################################
#
# https://github.com/dbafromthecold/SQLServerKubernetesHelm
# 
# Packaging a chart
#  
# Andrew Pruski
# 
###################################################################################################
###################################################################################################



# create a chart
helm create ourchart



# view the chart directory
ls .\ourchart



# view the templates directory
ls .\ourchart\templates



# remove all yaml files in the templates directory
rm .\ourchart\templates\*yaml



# get azure sql edge image tags
$repo = invoke-webrequest https://mcr.microsoft.com/v2/azure-sql-edge/tags/list
$($repo.content | ConvertFrom-Json).tags



# copy yaml files into the chart
TBD



# replace NOTES.txt file
rm .\ourchart\templates\NOTES.txt
echo 'A test Helm Chart' > .\ourchart\templates\NOTES.txt



# remove the charts and tests directory within the chart (they're not needed)
rm -r .\ourchart\charts
rm -r .\ourchart\templates\tests



# deploy the chart
helm install ourchart .\ourchart



# view release
helm list



# view kubernetes objects
kubectl get all



# delete the release
helm delete ourchart



# update the deployment yaml to use template directives
# copy {{ .Release.Name }} in for the deployment name



# also update the value.yaml file, removing the old file
rm .\ourchart\values.yaml



# and add in a custom value
echo 'containerImage: azure-sql-edge:1.0.3' > .\ourchart\values.yaml


# update the deployment yaml to use the new default value
# copy {{ .Values.containerImage }} in for the container image name



# now redeploy the chart
helm install ourchart .\ourchart



# view release
helm list



# view kubernetes objects
kubectl get all



# view the container image in the deployment
kubectl get deployment -o jsonpath='{ .items[*].spec.template.spec.containers[*].image }'



# now upgrade the chart, overriding the image name in the values file
helm upgrade ourchart .\ourchart --set containerImage=azure-sql-edge:1.0.4



# view the container image in the deployment
kubectl get deployment -o jsonpath='{ .items[*].spec.template.spec.containers[*].image }'



# package the chart
helm package .\azure-sql-edge-1.0.0 --destination .



# view packaged chart
ls C:\Charts\
