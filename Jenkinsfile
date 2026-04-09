pipeline {
    agent any

    environment {
        IMAGE_NAME = "djangogoat-app"
        CONTAINER_NAME = "djangogoat-container"
    }

    stages {

        stage('Clone Repo') {
            steps {
                git 'https://github.com/laxmisah736/DjanGoat-fork.git'
            }
        }

        stage('Build Docker Image') {
            steps {
                sh 'docker build -t $IMAGE_NAME .'
            }
        }

        stage('Stop Old Container') {
            steps {
                sh '''
                docker stop $CONTAINER_NAME || true
                docker rm $CONTAINER_NAME || true
                '''
            }
        }

        stage('Run Container') {
            steps {
                sh '''
                docker run -d -p 8000:8000 --name $CONTAINER_NAME $IMAGE_NAME
                '''
            }
        }
    }
}
