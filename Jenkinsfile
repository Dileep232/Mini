pipeline {
    agent any

    stages {

        stage('Git Checkout') {
            steps {
                deleteDir()
                git branch: 'app2', url: 'https://github.com/Dileep232/Mini.git'
            }
        }

        stage('Docker Image Build') {
            steps {
                sh '''
                docker build -t app2:${BUILD_NUMBER} .

                docker tag app2:${BUILD_NUMBER} dileep232/app2:${BUILD_NUMBER}

                docker tag app2:${BUILD_NUMBER} dileep232/app2:latest
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
                docker push dileep232/app2:${BUILD_NUMBER}

                docker push dileep232/app2:latest
                '''
            }
        }
stage('Deploy to Kubernetes') {
    steps {
        sh """
        scp -o StrictHostKeyChecking=no deployment.yaml root@18.61.227.64:/root/
        scp -o StrictHostKeyChecking=no service.yaml root@18.61.227.64:/root/
        scp -o StrictHostKeyChecking=no ingress.yaml root@18.61.227.64:/root/

        ssh -o StrictHostKeyChecking=no root@18.61.227.64 '
        kubectl apply -f /root/deployment.yaml
        kubectl apply -f /root/service.yaml
        kubectl apply -f /root/ingress.yaml

        kubectl set image deployment/app2-deployment \
        app2=dileep232/app2:${BUILD_NUMBER}

        kubectl rollout status deployment/app2-deployment
        '
        """
    }
}
    }
        post {
         always {
          sh '''
            docker rmi -f app2:${BUILD_NUMBER} || true
            docker rmi -f dileep232/app2:${BUILD_NUMBER} || true
            docker rmi -f dileep232/app2:latest || true
            docker image prune -f || true
         '''
       }
     }
 }


        
