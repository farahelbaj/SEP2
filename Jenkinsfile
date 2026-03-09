pipeline {
    agent any

    stages {
        stage('Checkout') {
            steps {
                git branch: 'main', url: 'https://github.com/farahelbaj/SEP2.git'
            }
        }

        stage('Build JAR') {
            steps {
                bat 'mvn clean package -DskipTests'
            }
        }

        stage('Build Docker Image') {
            steps {
                bat 'docker compose build'
            }
        }

        stage('Run Containers') {
            steps {
                bat 'docker compose up -d'
            }
        }

        stage('Check Running Containers') {
            steps {
                bat 'docker ps'
            }
        }

        stage('Check Database Table') {
            steps {
                bat 'docker exec calculator-db mariadb -uroot -pHera-95 -e "USE calc_data; SHOW TABLES;"'
            }
        }
    }

    post {
        always {
            bat 'docker compose down'
        }
    }
}