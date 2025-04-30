pipeline {
    agent any
    environment {
        EC2_IP = '3.26.0.175'
        DOCKER_IMAGE = 'ridergami-portfolio:latest'
    }
    stages {
        stage('Checkout') {
            steps {
                git 'https://github.com/dad1755/ridergami-portfolio.git'
            }
        }
        stage('Build Docker Image') {
            steps {
                script {
                    // Build Docker image
                    sh 'docker build -t $DOCKER_IMAGE .'
                }
            }
        }
        stage('Deploy to EC2') {
            steps {
                script {
                    // SSH into EC2 and run the Docker container
                    sh '''
                    ssh -o StrictHostKeyChecking=no -i /home/ec2-user/aws/dad.pem ec2-user@$EC2_IP << EOF
                    docker stop ridergami-portfolio || true
                    docker rm ridergami-portfolio || true
                    docker run -d --name ridergami-portfolio -p 80:80 $DOCKER_IMAGE
                    EOF
                    '''
                }
            }
        }
    }
}
