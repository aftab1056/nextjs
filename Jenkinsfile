pipeline {
    agent any

    environment {
        // Ensure 'vercel_token' matches the ID in your Jenkins Credentials Provider
        VERCEL_TOKEN = credentials('vercel_token')
    }

    stages {
        stage('Install') {
            steps {
                sh 'npm install'
            }
        }

        stage('Test') {
            steps {
                // Use echo instead of a raw string to avoid shell errors
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
                // Use double quotes to ensure the environment variable is passed correctly
                sh "npx vercel --prod --yes --token=$VERCEL_TOKEN"
            }
        }
    }
}