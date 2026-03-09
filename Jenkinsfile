pipeline {
    agent any

    tools {
        jdk 'JDK21'
    }

    stages {
        stage('Checkout') {
            steps {
                git branch: 'main', url: 'https://github.com/farahelbaj/SEP2.git'
            }
        }

        stage('Check Java Version') {
            steps {
                bat 'java -version'
                bat 'mvn -version'
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

        stage('Wait for Database') {
            steps {
                bat 'powershell -Command "Start-Sleep -Seconds 15"'
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