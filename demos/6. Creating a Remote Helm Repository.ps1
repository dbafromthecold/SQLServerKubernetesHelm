###################################################################################################
###################################################################################################
#
# https://github.com/dbafromthecold/SQLServerKubernetesHelm
# 
# Creating a remote Helm repository
#  
# Andrew Pruski
# 
###################################################################################################
###################################################################################################



##################################################
# go to Github and create a repository
##################################################



# clone repository locally
git clone https://github.com/dbafromthecold/DemoHelmRepo.git



# navigate to repo
cd DemoHelmRepo



# copy packaged chart into repo
cp ../testchart-0.1.0.tgz .



# index repo
helm repo index .



# view index.yaml
cat index.yaml



# push chart to Github
git add .
git commit -m "added testchart to repo"
git push



##################################################
# get URL from index.yaml file in GitHub repository
##################################################



# add Githb repo as a Helm repository
helm repo add testrepo https://raw.githubusercontent.com/dbafromthecold/DemoHelmRepo/master



# view new Helm repository
helm repo list



# search new Helm repository
helm search repo testrepo/testchart



# deploy chart from repository
helm install testchart testrepo/testchart



# confirm deployment
helm list
