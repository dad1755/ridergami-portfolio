pipeline {
    agent any
    stages {
        stage('Checkout') {
            steps {
                git url: 'https://github.com/dad1755/ridergami-portfolio', branch: 'main'
            }
        }
        stage('Build') {
            steps {
                sh 'echo "Build successful"' // Add your build steps here
            }
        }
        stage('Deploy') {
            steps {
                sh 'ls -la' // Verify files (index.html, deploy.yml, inventory.ini)
                ansiblePlaybook(
                    playbook: 'deploy.yml',
                    inventory: 'inventory.ini',
                    credentialsId: 'ansible-ssh-key',
                    colorized: true
                )
            }
        }
    }
}
