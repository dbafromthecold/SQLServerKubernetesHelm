###################################################################################################
###################################################################################################
#
# https://github.com/dbafromthecold/SQLServerKubernetesHelm
# 
# Packaging a chart
#  
# Andrew Pruski
# @dbafromthecold
# www.dbafromthecold.com
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



# remove the default values.yaml file
rm ./testchart/values.yaml



# create a values.yaml file
echo 'saPassword: Testing1122' > ./testchart/values.yaml



# copy templates into the chart
cp -R /mnt/c/git/dbafromthecold/SQLServerKubernetesHelm/yaml/* ./testchart/templates/



# view the templates directory
ls ./testchart/templates



# create NOTES.txt file
echo 'A test Helm Chart' > ./testchart/templates/NOTES.txt



# remove the charts directory (not needed, no chart dependencies)
rm -r ./testchart/charts



# list contents of chart
ls ./testchart



# view chart.yaml
cat ./testchart/Chart.yaml



# test deploying the chart
helm install testchart ./testchart --dry-run --debug



# deploy the chart
helm install testchart ./testchart



# view release
helm list



# view kubernetes objects
kubectl get all -n azure-sql-edge



# view deployment labels
kubectl get deployment -n azure-sql-edge --show-labels



# delete the release
helm delete testchart



# view secret.yaml file - note the code to pull the value
cat ./testchart/templates/azure-sql-edge-secret.yaml



# update the deployment yaml to use template directives
# copy {{ .Release.Name }} in for the deployment name
vim ./testchart/templates/azure-sql-edge-deployment.yaml



# also update the value.yaml file, removing the old file
rm ./testchart/values.yaml



# get azure sql edge image tags
curl https://mcr.microsoft.com/v2/azure-sql-edge/tags/list > list
cat list



# and add in a custom value
echo 'saPassword: Testing1122
containerImage: mcr.microsoft.com/azure-sql-edge:1.0.3' > ./testchart/values.yaml



# confirm values.yaml
cat ./testchart/values.yaml



# update the deployment yaml to use the new default value
# copy {{ .Values.containerImage }} in for the container image name
vim ./testchart/templates/azure-sql-edge-deployment.yaml



# now redeploy the chart
helm install testchart ./testchart



# view release
helm list



# view status
helm status testchart



# view kubernetes objects - note deployment name
kubectl get all -n azure-sql-edge



# view the container image in the deployment
kubectl get deployment -n azure-sql-edge -o jsonpath='{ .items[*].spec.template.spec.containers[*].image }' && echo ""



# get Azure SQL Edge version (1557)
IpAddress=$(kubectl get service sqledge-deployment -n azure-sql-edge --no-headers -o custom-columns=":status.loadBalancer.ingress[*].ip")
mssql-cli -S $IpAddress -U sa -P Testing1122 -Q "SELECT @@VERSION AS [Version];"



# now upgrade the chart, overriding the image name in the values file
helm upgrade testchart ./testchart --set containerImage=mcr.microsoft.com/azure-sql-edge:1.0.4



# view release
helm list



# view status
helm status testchart



# view history
helm history testchart



# view supplied values
helm get values testchart



# view the container image in the deployment
kubectl get deployment -n azure-sql-edge -o jsonpath='{ .items[*].spec.template.spec.containers[*].image }' && echo ""



# confirm kubernetes objects
kubectl get all -n azure-sql-edge



# get Azure SQL Edge version (1559)
IpAddress=$(kubectl get service sqledge-deployment -n azure-sql-edge --no-headers -o custom-columns=":status.loadBalancer.ingress[*].ip")
mssql-cli -S $IpAddress -U sa -P Testing1122 -Q "SELECT @@VERSION AS [Version];"



# package the chart
helm package ./testchart --destination .



# view packaged chart
ls -al



# clean up 
helm delete testchart
