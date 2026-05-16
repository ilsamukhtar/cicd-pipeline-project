pipeline {
    agent any

    environment {
        DOCKERHUB_USER = 'ilsamukhtar'
        IMAGE_NAME     = 'flask-cicd-app'
        IMAGE_TAG      = "${env.BUILD_NUMBER}"
        DOCKER_IMAGE   = "${DOCKERHUB_USER}/${IMAGE_NAME}:${IMAGE_TAG}"
    }

    stages {

        stage('Checkout') {
            steps {
                echo '==> Code pull kar raha hoon GitHub se...'
                checkout scm
            }
        }

        stage('Install Dependencies') {
            steps {
                echo '==> Python requirements install ho rahe hain...'
                sh 'pip install -r app/requirements.txt'
            }
        }

        stage('Run Tests') {
            steps {
                echo '==> Pytest chal raha hai...'
                sh 'cd app && python -m pytest tests/ -v'
            }
        }

        stage('Build Docker Image') {
            steps {
                echo "==> Docker image ban rahi hai: ${DOCKER_IMAGE}"
                sh "docker build -t ${DOCKER_IMAGE} ."
                sh "docker tag ${DOCKER_IMAGE} ${DOCKERHUB_USER}/${IMAGE_NAME}:latest"
            }
        }

        stage('Push to DockerHub') {
            steps {
                echo '==> DockerHub pe push ho rahi hai image...'
                withCredentials([usernamePassword(
                    credentialsId: 'dockerhub-credentials',
                    usernameVariable: 'DOCKER_USER',
                    passwordVariable: 'DOCKER_PASS'
                )]) {
                    sh 'echo $DOCKER_PASS | docker login -u $DOCKER_USER --password-stdin'
                    sh "docker push ${DOCKER_IMAGE}"
                    sh "docker push ${DOCKERHUB_USER}/${IMAGE_NAME}:latest"
                }
            }
        }

        stage('Deploy to Kubernetes') {
            steps {
                echo '==> Kubernetes pe deploy ho raha hai...'
                sh 'kubectl apply -f kubernetes/namespace.yaml'
                sh 'kubectl apply -f kubernetes/deployment.yaml'
                sh 'kubectl apply -f kubernetes/service.yaml'
            }
        }

        stage('Verify Deployment') {
            steps {
                echo '==> Pods aur services check ho rahe hain...'
                sh 'kubectl get pods -n flask-app'
                sh 'kubectl get services -n flask-app'
            }
        }
    }

    post {
        success {
            echo '✅ Pipeline successfully completed!'
        }
        failure {
            echo '❌ Pipeline fails.'
        }
    }
}
