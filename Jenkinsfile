pipeline {
  agent any
  environment {
    DOCKERHUB_USER = 'yourusername'
  }
  stages {
    stage('Checkout') {
      steps {
        git 'https://github.com/your-org/product-catalog.git'
      }
    }
    stage('Build Docker Image') {
      steps {
        sh 'docker build -t $DOCKERHUB_USER/product-catalog:latest .'
      }
    }
    stage('Push to DockerHub') {
      steps {
        withCredentials([usernamePassword(credentialsId: 'dockerhub-creds', usernameVariable: 'USERNAME', passwordVariable: 'PASSWORD')]) {
          sh 'echo $PASSWORD | docker login -u $USERNAME --password-stdin'
          sh 'docker push $DOCKERHUB_USER/product-catalog:latest'
        }
      }
    }
    stage('Deploy') {
      steps {
        sh './deploy.sh'
      }
    }
  }
}

