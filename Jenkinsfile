pipeline {
    agent any

    environment {
        // Ensure 'vercel-token' is set up in Jenkins Credentials
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
                // Using 'echo' instead of trying to execute a string as a command
                echo 'Skipping tests - none found'
            }
        }

        stage('Build') {
            steps {
                sh 'npm run build'
            }
        }

        stage('Deploy') {
            steps {
                /* In Linux 'sh', we use $VERCEL_TOKEN. 
                   Single quotes prevent the shell from interpreting the variable, 
                   allowing Jenkins to pass it securely.
                */
                sh 'npx vercel --prod --yes --token=$VERCEL_TOKEN'
            }
        }
    }
}