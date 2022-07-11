## Deploying SQL Server to Kubernetes using Helm

---

## Andrew Pruski

### SQL Server DBA, Microsoft Data Platform MVP, & Certified Kubernetes Administrator
<!-- .slide: style="text-align: left;"> -->
<i class="fab fa-twitter"></i><a href="https://twitter.com/dbafromthecold">  @dbafromthecold</a><br>
<i class="fas fa-envelope"></i>  dbafromthecold@gmail.com<br>
<i class="fab fa-wordpress"></i>  www.dbafromthecold.com<br>
<i class="fab fa-github"></i><a href="https://github.com/dbafromthecold">  github.com/dbafromthecold</a>

---

### Session Aim
<!-- .slide: style="text-align: left;"> -->
To provide an overview of Helm and how it can be used to deploy applications to Kubernetes

---

### Agenda
<!-- .slide: style="text-align: left;"> -->
- An overview of Kubernetes & Helm<br>
- Deploying an application<br>
- Upgrading an application using Helm<br>
- Rolling back an upgrade using Helm<br>
- Chart Repositories

---

# Kubernetes

---

## What is Kubernetes?

"Kubernetes is a portable, extensible open-source platform for managing containerized workloads and services, that facilitates both declarative configuration and automation. It has a large, rapidly growing ecosystem. Kubernetes services, support, and tools are widely available"<br>
<font size="6"><a href="https://kubernetes.io/">kubernetes.io</a></font>

---

# Helm

---

### What is Helm?

<img src="images/helm_logo.png"  style="float: right"/>
<!-- .slide: style="text-align: left;"> -->
<br>
<font size="6">
A package manager for Kubernetes<br>
Charts define applications<br>
With Helm you can: -<br>
    - Mange complexity<br>
    - Easily update and rollback<br>
    - Share charts<br>
</font>

---

### History of Helm
<!-- .slide: style="text-align: left;"> -->
- Created in 2015<br>
- Introduced at KubeCon in November 2015<br>
- Merged with Google's Deployment Manager in January 2016<br>
- Open source - https://github.com/helm/helm<br>
- More than 2 million downloads a month<br>
- Graduated status within the CNCF in April 2020<br>

---

### Helm Hub
<!-- .slide: style="text-align: left;"> -->
<p align="center">
<a href="https://artifacthub.io/">
<img src="images/artifact_hub.png" />
</a>
</p>

---

### Deploying SQL Server to Kubernetes
<!-- .slide: style="text-align: left;"> -->
Potential yaml files are: -<br>
- Namespace
- Storage class 
- Persistent Volumes
- Persistent Volume Claims
- Secret
- Deployment
- Service

---

# Demo Environment

---

### My Raspberry Pi Kubernetes Cluster
<!-- .slide: style="text-align: left;"> -->
<font size="6">
<a href="https://dbafromthecold.com/2020/11/30/building-a-raspberry-pi-cluster-to-run-azure-sql-edge-on-kubernetes/">Building a Raspberry Pi cluster to run Azure SQL Edge on Kubernetes</a><br>
</font>

<p align="center">
<img src="images/raspberrypi_kubernetes.png" />
</p>

---

# Demos

---

# Packaging a Chart

---

### Chart Structure
<!-- .slide: style="text-align: left;"> -->
<p align="center">
<img src="images/chart_directory.png" />
</p>

---

### Chart Template Directory
<!-- .slide: style="text-align: left;"> -->
<p align="center">
<img src="images/chart_template_directory.png" />
</p>

---

# Demos

---

# Creating a Helm repository

---

### Github Repository
<!-- .slide: style="text-align: left;"> -->
<p align="center">
<img src="images/helm_repository.png" />
</p>

---

### Index.yaml
<!-- .slide: style="text-align: left;"> -->
<p align="center">
<img src="images/index_yaml.png" />
</p>

---

# Demos

---

### Resources
<!-- .slide: style="text-align: left;"> -->
<font size="6">
<a href="https://github.com/dbafromthecold/SQLServerKubernetesHelm">https://github.com/dbafromthecold/SQLServerKubernetesHelm</a><br>
<a href="https://www.pluralsight.com/courses/kubernetes-package-administration-helm">https://www.pluralsight.com/courses/kubernetes-package-administration-helm</a><br>
<a href="https://artifacthub.io/">https://artifacthub.io</a><br>
</font>

<p align="center">
<img src="images/qr_code.png" />
</p>
