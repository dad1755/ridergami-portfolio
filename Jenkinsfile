pipeline {
    agent any

    stages {
        stage('Clone Repo') {
            steps {
                git branch: 'main', url: 'https://github.com/dad1755/ridergami-portfolio'
            }
        }

        stage('Run Ansible Deploy') {
            steps {
                sh 'ansible-playbook -i inventory.ini deploy.yml'
            }
        }
    }
}
