pipeline {

    agent any

    stages {
        stage('Build') {
            steps {
                script {
                    sh 'echo build stage done'
                }
            }
        }

        stage('Test') {
            steps {
                script {
                    sh 'echo test stage done'
                }
            }
        }

        stage('Deploy') {
            steps {
                script {
                    sh 'echo deploy stage done'
                }
            }
        }
    }
}