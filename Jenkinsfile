pipeline {
    agent any

    stages {

        stage('Git Checkout') {
            steps {
                deleteDir()
                git 'https://github.com/Dileep232/Mini.git'
            }
        }

        stage('Docker Image Build') {
            steps {
                sh '''
                docker build -t app:${BUILD_NUMBER} .

                docker tag app:${BUILD_NUMBER} dileep232/app:${BUILD_NUMBER}

                docker tag app:${BUILD_NUMBER} dileep232/app:latest
                '''
            }
        }

        stage('Login to DockerHub') {
            steps {
                withCredentials([
                    usernamePassword(
                        credentialsId: 'Dockercred',
                        usernameVariable: 'DOCKER_USER',
                        passwordVariable: 'DOCKER_PASSWD'
                    )
                ]) {
                    sh '''
                    echo "$DOCKER_PASSWD" | docker login -u "$DOCKER_USER" --password-stdin
                    '''
                }
            }
        }

        stage('Push Image to DockerHub') {
            steps {
                sh '''
                docker push dileep232/app:${BUILD_NUMBER}

                docker push dileep232/app:latest
                '''
            }
        }
stage('Deploy to Kubernetes') {
    steps {
        sh """
        scp -o StrictHostKeyChecking=no deployment.yaml root@18.61.83.98:/root/
        scp -o StrictHostKeyChecking=no service.yaml root@18.61.83.98:/root/

        ssh -o StrictHostKeyChecking=no root@18.61.83.98 '
        kubectl apply -f /root/deployment.yaml
        kubectl apply -f /root/service.yaml

        kubectl set image deployment/myapp-deployment \
        myapp=dileep232/app:${BUILD_NUMBER}

        kubectl rollout status deployment/myapp-deployment
        '
        """
    }
}
    }
        post {
         always {
          sh '''
            docker rmi -f app:${BUILD_NUMBER} || true
            docker rmi -f dileep232/app:${BUILD_NUMBER} || true
            docker rmi -f dileep232/app:latest || true
            docker image prune -f || true
         '''
       }
     }
 }


        
