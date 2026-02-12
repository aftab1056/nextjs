pipeline {
    agent any

    environment {
        VERCEL_TOKEN = credentials('vercel_token')
        NPM_CONFIG_CACHE = "${WORKSPACE}/.npm"
    }

    stages {

        stage('Node Check') {
            steps {
                sh '''
                    echo "Node version:"
                    node -v
                    echo "npm version:"
                    npm -v
                '''
            }
        }

        stage('Install Dependencies') {
            steps {
                sh '''
                    npm ci
                '''
            }
        }

        stage('Test') {
            steps {
                echo 'No tests defined — skipping'
            }
        }

        stage('Build') {
            steps {
                sh 'npm run build'
            }
        }

        stage('Deploy to Vercel') {
            steps {
                sh '''
                    npx vercel pull --yes --environment=production --token=$VERCEL_TOKEN
                    npx vercel build --prod --token=$VERCEL_TOKEN
                    npx vercel deploy --prebuilt --prod --token=$VERCEL_TOKEN
                '''
            }
        }
    }
}