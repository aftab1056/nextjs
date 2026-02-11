pipeline {
    agent any
    
    environment {
        VERCEL_TOKEN = credentials('vercel_token')
        
    }
    
    tools {
        nodejs 'NodeJS-18'  // Match the name you gave in Global Tool Configuration
    }
    
    stages {
        stage('Install') {
            steps {
               sh 'npm install'
            }
        }
        // ... rest of your stages
    }
}
