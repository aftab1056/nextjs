pipeline {
    agent any
    
    environment {
        VERCEL_TOKEN = credentials('vercel_token')
        // Optional: Add PATH if npm still not found
        // PATH = "/usr/bin:${env.PATH}"
    }
    
    stages {
        stage('Install') {
            steps {
               sh 'npm install'
            }
        }
        stage('Build') {
            steps {
               sh 'npm run build'
            }
        }
        stage('Deploy') {
            steps {
               sh 'npx vercel --prod --yes --token=$VERCEL_TOKEN'
            }
        }
    }
}