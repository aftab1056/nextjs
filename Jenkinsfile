// pipeline {
//     agent any

//     environment {
//         // Ensure 'vercel-token' is set up in Jenkins Credentials
//         VERCEL_TOKEN = credentials('vercel_token')
//     }
//     stages {
//         stage('Install') {
//             steps {
//                 sh 'npm install'
//             }
//         }

//         stage('Test') {
//             steps {
//                 // Using 'echo' instead of trying to execute a string as a command
//                 echo 'Skipping tests - none found'
//             }
//         }

//         stage('Build') {
//             steps {
//                 sh 'npm run build'
//             }
//         }

//         stage('Deploy') {
//             steps {
//                 /* In Linux 'sh', we use $VERCEL_TOKEN. 
//                    Single quotes prevent the shell from interpreting the variable, 
//                    allowing Jenkins to pass it securely.
//                 */
//                 sh 'npx vercel --prod --yes --token=$VERCEL_TOKEN'
//             }
//         }
//     }
// }


// node {
//     def appDir = '/var/www/nextjs-app'

//     stage('Clean Workspace') {
//         echo 'cleaning jenkins workspace'
//         deleteDir()
//     }

//     stage('Cloning Repo') {
//         echo 'cloning the repo'
//         git(
//             branch: 'main',
//             url: 'https://github.com/aftab1056/nextjs'
//         )
//     }

//     stage('Deploy to EC2') {
//         echo 'deploying to ec2'

//         sh """
//             sudo mkdir -p ${appDir}
//             sudo chown -R jenkins:jenkins ${appDir}
//             rsync -av --delete --exclude='.git' --exclude='node_modules' ./ ${appDir}
//             cd ${appDir}
//             sudo npm install
//             sudo npm run build
//             sudo fuser -k 3000/tcp || true
//             sudo npm run start &
//         """
//     }
// }


pipeline {
    agent any 

    environment {
        CONTAINER_NAME = "nextjs"
        IMAGE_NAME = 'nextjs-image'
        EMAIL = 'aftabjamil760@gmail.com'
        PORT = "3000"
    }

    stages {
        stage('Clone Repo'){
            steps{
                git branch: 'main', url: 'https://github.com/aftab1056/nextjs'
            }
        }
        stage('Build Docker image'){
            steps {
                sh 'docker build -t $IMAGE_NAME .'
            }
        }
         stage('Stop & Remove Previous Container'){
            steps {
                sh '''
                    docker stop $CONTAINER_NAME || 
                    true
                    docker rm $CONTAINER_NAME || true
                    '''
            }
        }
        stage('Docker & Container Run'){
            steps{
                sh '''
                    docker run -d -p ${PORT}:${PORT}
                    --name $CONTAINER_NAME $IMAGE_NAME
                    '''
            }
        }
        
        stage('Send Email Notification'){
            steps{
                emailext(
                    subject: "nextjs app deployed successfully on ec2!",
                    body:   "http://3.26.188.211:${PORT}/",
                    to:  "${EMAIL}"
                )
                   
            }
        }
        
    }
}
