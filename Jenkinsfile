pipeline {
    agent any

    environment {
        VERCEL_TOKEN = credentials('vercel_token')
    }

    tools {
        nodejs "Node24" 
    }

    stages {
        stage('Check Version') {
            steps {
                sh 'node -v'
                sh 'npm -v'
            } // This was the missing brace!
        }

        stage('Install') {
            steps {
                sh 'npm install'
            }
        }

        stage('Test') {
            steps {
                echo 'Skipping tests - no test suite found.'
            }
        }

        stage('Build') {
            steps {
                sh 'npm run build'
            }
        }

        stage('Deploy') {
            steps {
                sh "npx vercel --prod --yes --token=$VERCEL_TOKEN"
            }
        }
    }
}