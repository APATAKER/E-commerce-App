# E-COMMERCE REACT APPLICATION CAPSTONE PROJECT
## DEMO
---
### TOOLS USED
- Docker
- Jenkins
- Git
- Prometheus
- Grafana
- AWS EC2 Instance

#### SETTING UP THE AWS EC2 INSTANCE
[PREREQUISITE]

&emsp;Installing git amazon Linux 2023
&emsp;&emsp;https://cloudkatha.com/how-to-install-git-on-amazon-linux-2023-instance/
&emsp;Installing Docker & Docker Compose
&emsp;&emsp;- https://docs.aws.amazon.com/serverless-application-model/latest/developerguide/install-docker.html
&emsp;&emsp;- https://medium.com/@fredmanre/how-to-configure-docker-docker-compose-in-aws-ec2-amazon-linux-2023-ami-ab4d10b2bcdc
&emsp;Installing Jenkins
&emsp;&emsp;https://www.jenkins.io/doc/tutorials/tutorial-for-installing-jenkins-on-AWS/
&emsp;Installing Grafana
&emsp;&emsp;https://grafana.com/grafana/download?pg=oss-graf&plcmt=hero-btn-1

##### Setting up Jenkins
&emsp;[Plugins]
&emsp; - Docker
&emsp; - Docker Commons
&emsp; - Docker Pipeline
&emsp; - Generic Webhook Trigger
&emsp; - Multibranch Scan Webhook Trigger
&emsp;[Update]
&emsp;&emsp;**Sudoers file** for Jenkins to have full Access to docker commands
&emsp;&emsp;&emsp;`sudo visudo -f /etc/sudoers`
&emsp;&emsp;&emsp;&emsp;`Defaults:jenkins !authenticate`
&emsp;&emsp;&emsp;&emsp;`jenkins ALL=(ALL) ALL`
&emsp;[WebHook]
&emsp;&emsp;==http://<publicIp>:8080/multibranch-webhook-trigger/invoke?token=App==

##### Setting up Grafana
&emsp;[Data Source]
&emsp;&emsp;select Prometheus and enter url to test it.
&emsp;[Dashboard]
&emsp;&emsp;import a dashboard using **12708** for **Nginx Exporter**

[USERDATA]
`#!/bin/sh`
>Installing Git
`sudo dnf install git -y`

>Installing Jenkins
`sudo wget -O /etc/yum.repos.d/jenkins.repo \
    https://pkg.jenkins.io/redhat-stable/jenkins.repo`
`sudo rpm --import https://pkg.jenkins.io/redhat-stable/jenkins.io-2023.key`
`sudo yum upgrade`
`sudo dnf install java-17-amazon-corretto -y`
`sudo yum install jenkins -y`
`sudo systemctl enable jenkins`
`sudo systemctl start jenkins`

>Installing Docker
`sudo yum install -y docker`
`sudo service docker start`
`sudo curl -L https://github.com/docker/compose/releases/latest/download/docker-compose-$(uname -s)-$(uname -m) -o /usr/local/bin/docker-compose`
`sudo chmod +x /usr/local/bin/docker-compose`

>Adding Permission to access docker by diffrent USER 
`sudo usermod -a -G docker ec2-user`
`sudo usermod -a -G docker Jenkins`
`newgrp docker`

>Installing Grafana
`sudo yum install -y https://dl.grafana.com/enterprise/release/grafana-enterprise-11.2.2+security~01-1.x86_64.rpm`
`sudo /bin/systemctl daemon-reload`
`sudo /bin/systemctl enable grafana-server.service`
`sudo /bin/systemctl start grafana-server.service`

### SCREENSHOTS
CSP - 1. Jenkins Console, Jenkins Configuration, Multi-branch Pipeline, Pipeline Output and Pipeline Stages
CSP - 2. AWS EC2 Console and Security Group configuration
CSP - 3. DockerHub Repos Both public and private
CSP - 4. E-Commerce React Application
CSP - 5. Monitoring, Grafana console, Adding Data Source, Creating Dashboard and Alerts with Email Notification