pipeline {
    agent any
    options {
        buildDiscarder(logRotator(numToKeepStr: '5'))
    }
    environment {
        DOCKERHUB_CREDENTIALS = credentials('dockerhub')
    }
    stages {
        stage('Pull') {
            steps {
                git branch: 'main', url: 'https://github.com/21127382-21127614-21127474/Jenkins-CICD.git'
            }
        }
        stage('Build') {
            steps {
                sh 'docker build -t 211273822112761421127474/jenkins-docker-hub .'
            }
            }
        stage('Login') {
            steps {
                sh 'echo $DOCKERHUB_CREDENTIALS_PSW | docker login -u $DOCKERHUB_CREDENTIALS_USR --password-stdin'
            }
        }
        stage('Push') {
            steps {
                sh 'docker push 211273822112761421127474/jenkins-docker-hub'
            }
        }
    }
}
