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
                    dockerImage = docker.build registry + ":$BUILD_NUMBER"
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
                    sh '''
                        if docker ps | grep -q my-nginx-container; then
                            docker rm -f my-nginx-container
                        fi
                        docker run -d -p 4000:80 --name my-nginx-container 211273822112761421127474/crypto-site-nginx
                    '''
                }
            }
        }
        

    }
}
