pipeline {
    agent any

    stages {
        stage('Checkout') {
            steps {
                // Only one SCM checkout
                checkout scm
            }
        }

        stage('Build & Deploy Docker') {
            steps {
                // Build and deploy Docker
                sh '''
                docker compose build
                docker compose up -d
                '''
            }
        }
    }

    post {
        always {
            echo 'Pipeline Finished'
        }
    }
}
