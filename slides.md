## Deploying SQL Server to Kubernetes using Helm

---

## Andrew Pruski

### SQL Server DBA, Microsoft Data Platform MVP, & Certified Kubernetes Administrator
<!-- .slide: style="text-align: left;"> -->
<i class="fab fa-twitter"></i><a href="https://twitter.com/dbafromthecold">  @dbafromthecold</a><br>
<i class="fas fa-envelope"></i>  dbafromthecold@gmail.com<br>
<i class="fab fa-wordpress"></i>  www.dbafromthecold.com<br>
<i class="fab fa-github"></i><a href="https://github.com/dbafromthecold">  github.com/dbafromthecold.com</a>

---

### Session Aim
<!-- .slide: style="text-align: left;"> -->
To provide an overview of Helm and how it can be used to deploy applications (SQL Server) to Kubernetes

---

### Agenda
<!-- .slide: style="text-align: left;"> -->
- An overview of Helm<br>
- How to deploy an application (SQL Server) to Kubernetes using Helm<br>
- Upgrading an application using Helm<br>
- Rolling back an upgrade using Helm<br>
- Chart Repositories

---

### What is Helm?
<!-- .slide: style="text-align: left;"> -->
<font size="6">
<a href="https://helm.sh/">https://helm.sh/</a><br>
</font>

<p align="left">
<img src="images/helm_logo.png" />
</p>

<!-- .slide: style="text-align: right;"> -->
A package manager for Kubernetes<br>
Charts help define Kubernetes applications<br>
With Helm you can: -<br>
Mange complexity<br>
Easily update and rollback<br>
Share charts<br>

---

### History of Helm
<!-- .slide: style="text-align: left;"> -->
<font size="6">
Helm was created in 2015 at Deis<br>
Helm Classic was introduced at KubeCon in November 2015<br>
Helm Classic was merged with Google's Deployment Manager in January 2016<br>
Open source at github at https://github.com/helm/helm<br>
More than 2 million downloads a month<br>
Graduated status within the CNCF in April 2020<br>
</font>

---

### Helm Hub

<p align="center">
<a href="https://artifacthub.io/">
<img src="images/artifact_hub.png" />
</a>
</p>

---

### My Raspberry Pi Kubernetes Cluster
<!-- .slide: style="text-align: left;"> -->
<font size="6">
<a href="https://dbafromthecold.com/2020/11/30/building-a-raspberry-pi-cluster-to-run-azure-sql-edge-on-kubernetes/">Building a Raspberry Pi cluster to run Azure SQL Edge on Kubernetes</a><br>
</font>

<p align="center">
<img src="images/raspberrypi_k8scluster.png" />
</p>

---

# Demos

---

## Resources
<!-- .slide: style="text-align: left;"> -->
<font size="6">
<a href="https://github.com/dbafromthecold/SQLServerKubernetesHelm">https://github.com/dbafromthecold/SQLServerKubernetesHelm</a><br>
</font>