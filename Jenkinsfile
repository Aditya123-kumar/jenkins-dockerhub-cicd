
pipeline {
    agent any

    environment {
        IMAGE_NAME = 'adityakumar0101/jenkins-dockerhub-cicd'
        IMAGE_TAG  = 'v1'
    }

    stages {
        stage('Checkout') {
            steps {
                git branch: 'main',
                    url: 'https://github.com/Aditya123-kumar/jenkins-dockerhub-cicd.git'
            }
        }

        stage('Build Docker Image') {
            steps {
                bat 'docker build -t %IMAGE_NAME%:%IMAGE_TAG% .'
            }
        }

        stage('Verify Docker Image') {
            steps {
                bat 'docker image inspect %IMAGE_NAME%:%IMAGE_TAG%'
            }
        }

        stage('Login and Push to Docker Hub') {
            steps {
                withCredentials([usernamePassword(
                    credentialsId: 'dockerhub-creds',
                    usernameVariable: 'DOCKERHUB_USER',
                    passwordVariable: 'DOCKERHUB_TOKEN'
                )]) {
                    bat '''
                        @echo off
                        echo %DOCKERHUB_TOKEN% | docker login -u "%DOCKERHUB_USER%" --password-stdin
                        if errorlevel 1 exit /b 1
                        docker push %IMAGE_NAME%:%IMAGE_TAG%
                    '''
                }
            }
        }
    }

    post {
        success {
            echo 'CI/CD pipeline completed successfully!'
        }
        failure {
            echo 'Pipeline failed. Check the stage logs.'
        }
    }
}
