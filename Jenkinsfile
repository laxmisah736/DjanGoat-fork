pipeline {
    agent any

    environment {
        IMAGE_NAME = "djangoat-deployment-web"
        COMPOSE_FILE = "docker-compose.yml"
    }

    stages {
        stage('Checkout') {
            steps {
                git(
                    url: 'https://github.com/laxmisah736/DjanGoat-fork.git',
                    branch: 'master',
                    credentialsId: 'ubuntu'
                )
            }
        }

        stage('Build Docker Image') {
            steps {
                script {
                    sh "docker compose -f ${COMPOSE_FILE} build --pull"
                }
            }
        }

        stage('Deploy Containers') {
            steps {
                script {
                    sh "docker compose -f ${COMPOSE_FILE} down --remove-orphans"
                    sh "docker compose -f ${COMPOSE_FILE} up -d"
                }
            }
        }

        stage('Post Deployment') {
            steps {
                script {
                    sh "docker ps --filter name=${IMAGE_NAME}"
                }
            }
        }
    }

    post {
        always {
            echo "Cleaning up unused Docker resources..."
            sh "docker system prune -f || true"
        }
        success {
            echo "Deployment successful!"
        }
        failure {
            echo "Deployment failed. Check logs for details."
        }
    }
}
