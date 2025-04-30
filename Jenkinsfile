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
                // Your existing build steps
                sh 'echo "Build successful"'
            }
        }
        stage('Deploy') {
            steps {
                // Ensure workspace has the index.html file
                sh 'ls -la'
                // Run Ansible playbook
                ansiblePlaybook(
                    playbook: 'deploy.yml',
                    inventory: 'inventory.yml',
                    credentialsId: 'ansible-ssh-key',
                    colorized: true
                )
            }
        }
    }
}
