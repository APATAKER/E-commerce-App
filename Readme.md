**E-COMMERCE REACT APPLICATION CAPSTONE PROJECT**
==============================================

**DEMO**
----

**TOOLS USED**
------------

* Docker
* Jenkins
* Git
* Prometheus
* Grafana
* AWS EC2 Instance

**SETTING UP THE AWS EC2 INSTANCE**
------------------------------------

### Prerequisites

* Installing git on Amazon Linux 2023: <https://cloudkatha.com/how-to-install-git-on-amazon-linux-2023-instance/>
* Installing Docker & Docker Compose:
	+ <https://docs.aws.amazon.com/serverless-application-model/latest/developerguide/install-docker.html>
	+ <https://medium.com/@fredmanre/how-to-configure-docker-docker-compose-in-aws-ec2-amazon-linux-2023-ami-ab4d10b2bcdc>
* Installing Jenkins: <https://www.jenkins.io/doc/tutorials/tutorial-for-installing-jenkins-on-AWS/>
* Installing Grafana: <https://grafana.com/grafana/download?pg=oss-graf&plcmt=hero-btn-1>

**SETTING UP JENKINS**
--------------------

### Plugins

* Docker
* Docker Commons
* Docker Pipeline
* Generic Webhook Trigger
* Multibranch Scan Webhook Trigger

### Update

* Sudoers file for Jenkins to have full access to docker commands:
```bash
sudo visudo -f /etc/sudoers
Defaults:jenkins !authenticate
jenkins ALL=(ALL) ALL
```
### WebHook
http://<EC2_IP>:8080/multibranch-webhook-trigger/invoke?token=App

**SETTING UP GRAFANA**
--------------------
* Data Source
    + Select Prometheus and enter URL to test it.
* Dashboard
    + Import a dashboard using **12708** for **Nginx Exporter**

**USERDATA**
----------
#!/bin/sh

### Installing Git
```
sudo dnf install git -y
```
### Installing Jenkins
```
sudo wget -O /etc/yum.repos.d/jenkins.repo https://pkg.jenkins.io/redhat-stable/jenkins.repo
sudo rpm --import https://pkg.jenkins.io/redhat-stable/jenkins.io-2023.key
sudo yum upgrade
sudo dnf install java-17-amazon-corretto -y
sudo yum install jenkins -y
sudo systemctl enable jenkins
sudo systemctl start jenkins
```
### Installing Docker
```
sudo yum install -y docker
sudo service docker start
sudo curl -L https://github.com/docker/compose/releases/latest/download/docker-compose-$(uname -s)-$(uname -m) -o /usr/local/bin/docker-compose
sudo chmod +x /usr/local/bin/docker-compose
```
### Adding Permission to access docker by different USER
```
sudo usermod -a -G docker ec2-user
sudo usermod -a -G docker Jenkins
newgrp docker
```
### Installing Grafana
```
sudo yum install -y https://dl.grafana.com/enterprise/release/grafana-enterprise-11.2.2+security~01-1.x86_64.rpm
sudo /bin/systemctl daemon-reload
sudo /bin/systemctl enable grafana-server.service
sudo /bin/systemctl start grafana-server.service
```
**SCREENSHOTS**
-------------
**CSP** - Capestone Project
1. Jenkins Console, Jenkins Configuration, Multi-branch Pipeline, Pipeline Output, and Pipeline Stages
2. AWS EC2 Console and Security Group configuration
3. DockerHub Repos (both public and private)
4. E-Commerce React Application
5. Monitoring, Grafana console, Adding Data Source, Creating Dashboard, and Alerts with Email Notification
