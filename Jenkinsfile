pipeline {
    agent any
    environment {
        DEV_REPO = 'dhilipraja/dev'
        PROD_REPO = 'dhilipraja/prod'
    }
    stages {
        stage('Build Docker Image') {
            steps {
                script {
                    // Build the Docker image with the branch name as a tag
                    if (env.BRANCH_NAME == 'dev') {
                        dockerImage = docker.build("${DEV_REPO}:${env.BUILD_NUMBER}")
                    } else if (env.BRANCH_NAME == 'main') {
                        dockerImage = docker.build("${PROD_REPO}:${env.BUILD_NUMBER}")
                    } 
                }
            }
        }
        stage('Push Docker Image to Docker Hub') {
            steps {
                script {
                    docker.withRegistry('https://registry.hub.docker.com', 'DockerHubCred') {
                        dockerImage.push("latest")
                        dockerImage.push("${env.BUILD_NUMBER}")
                    }
                }
            }
        }
        stage('Deploy') {
            //when {
            //    branch 'main'
            //}
            steps {
                script {
                    sh "chmod +x -R $WORKSPACE"
                    sh "./destroy.sh"
                    sh 'docker-compose up -d'
                }
            }
        }
    }
    

}