pipeline {
    agent { label 'slave-1-labels' }

    environment {
        TOMCAT_URL = 'http://35.154.158.146:8080'
        APP_NAME   = 'students-project'
    }

    stages {

        stage('Checkout') {
            steps {
                git branch: 'main', url: 'https://github.com/Ranjankumarjena-rj/students-project.git'
            }
        }

        stage('Build WAR') {
            steps {
                sh 'mvn clean package -DskipTests'
            }
        }

        stage('Deploy to Tomcat') {
            steps {
                sh '''
                    sudo cp target/students-project-1.0.war /var/lib/tomcat10/webapps/students-project.war
                    sudo systemctl restart tomcat10
                    sleep 10
                    echo "Deployed successfully!"
                '''
            }
        }
    }

    post {
        success {
            echo "App running at: ${TOMCAT_URL}/students-project"
        }
        failure {
            echo "Build failed! Check logs."
        }
    }
}
