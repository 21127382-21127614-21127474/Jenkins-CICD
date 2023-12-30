pipeline {
    agent any

    environment {
        dockerImage = ''
        registry = '211273822112761421127474/jenkins-docker-hub'
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
                sh 'docker build -t my-nginx .'
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
                sh 'docker run -d -p 3000:80 --name my-nginx-container my-nginx'
            }
        }
    }
}
        