pipeline {
    agent any
    tools {
        nodejs 'NodeJS18'   
    }
    environment {
        IMAGE_NAME = 'express-hello-world'
        IMAGE_TAG  = "${env.BUILD_NUMBER}"
    }

    stages {

        stage('Checkout') {
            steps {
                git branch: 'feature/devops',
                    url: 'https://github.com/Andyvo1009/express-hello-world.git'
            }
        }

        stage('Install Dependencies') {
            steps {
                sh 'yarn install --frozen-lockfile'
            }
        }

        stage('Test') {
            steps {
                sh 'yarn test'
            }
        }

        stage('Build Docker Image') {
            steps {
                sh "docker build -t ${IMAGE_NAME}:${IMAGE_TAG} ."
                sh "docker tag ${IMAGE_NAME}:${IMAGE_TAG} ${IMAGE_NAME}:latest"
            }
        }

    }

    post {
        success {
            echo "Pipeline succeeded! Image built: ${IMAGE_NAME}:${IMAGE_TAG}"
        }
        failure {
            echo 'Pipeline failed.'
        }
        always {
            cleanWs()
        }
    }
}