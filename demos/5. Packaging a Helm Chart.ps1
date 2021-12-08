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
helm create testchart



# view the chart directory
ls ./testchart



# view the templates directory
ls ./testchart/templates



# remove all files in the templates directory
rm -rf ./testchart/templates/*



# get azure sql edge image tags - get this to work in bash
repo=$(curl https://mcr.microsoft.com/v2/azure-sql-edge/tags/list/content/tags | jq)
$($repo.content | ConvertFrom-Json).tags



# copy yaml files into the chart
cp -R /mnt/c/git/dbafromthecold/SQLServerKubernetesHelm/yaml* ./testchart/templates/



# create NOTES.txt file
echo 'A test Helm Chart' > ./testchart/templates/NOTES.txt



# remove the charts directory (not needed, no chart dependencies)
rm -r .\testchart\charts



# deploy the chart
helm install testchart ./testchart



# view release
helm list



# view kubernetes objects
kubectl get all



# delete the release
helm delete testchart



# update the deployment yaml to use template directives
# copy {{ .Release.Name }} in for the deployment name



# also update the value.yaml file, removing the old file
rm ./testchart/values.yaml



# and add in a custom value
echo 'containerImage: azure-sql-edge:1.0.3' > ./testchart/values.yaml


# update the deployment yaml to use the new default value
# copy {{ .Values.containerImage }} in for the container image name



# now redeploy the chart
helm install testchart ./testchart



# view release
helm list



# view kubernetes objects
kubectl get all



# view the container image in the deployment
kubectl get deployment -o jsonpath='{ .items[*].spec.template.spec.containers[*].image }'



# now upgrade the chart, overriding the image name in the values file
helm upgrade testchart ./testchart --set containerImage=mcr.microsoft.com/azure-sql-edge:1.0.4



# view the container image in the deployment
kubectl get deployment -o jsonpath='{ .items[*].spec.template.spec.containers[*].image }'



# package the chart
helm package ./testchart --destination .


