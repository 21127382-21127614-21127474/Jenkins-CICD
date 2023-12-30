pipeline {
    agent any

    environment {
        dockerImage = ''
        registry = '211273822112761421127474/crypto-site-nginx'
        registryCredential = 'dockerhub'
    }
    stages {
        stage('Pull') {
            steps {
                git branch: 'main', url: 'https://github.com/21127382-21127614-21127474/Jenkins-CICD.git'
            }
        }
        stage('Build') {
            steps {
                script {
                    dockerImage = docker.build registry
                }
            }
        }
        stage('Push') {
            steps {
                script {
                    docker.withRegistry( '', registryCredential ) {
                        dockerImage.push()
                    }
                }
            }
        }
        stage('Deploy') {
            steps {
                withDockerRegistry(credentialsId: 'dockerhub', url: 'https://index.docker.io/v1/') {
                    sh 'docker run -d -p 3000:80 --name my-nginx-container 211273822112761421127474/crypto-site-nginx'
                }
            }

        }
    }
}
        