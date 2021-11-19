pipeline{
    agent {label "master"}
    environment {
        AWS_DEFAULT_REGION="eu-west-1"
    }
    stages{
        stage("clone"){
            steps{
                cleanWs()
                sh '''
                git clone https://github.com/will118118/showcase_flask_app.git
                
                '''
            }
        }

        stage("build image & test"){
            steps{
                withCredentials([usernamePassword(credentialsId: 'docker', passwordVariable: 'password', usernameVariable: 'username')]) {
                    sh '''
                cd showcase_flask_app
                echo building image
                docker context use default
                docker build -t ktao329/showcase_flask_app .
                '''
                }
            }
        }
        
        stage("push image"){
            steps{
                withCredentials([usernamePassword(credentialsId: 'docker', passwordVariable: 'password', usernameVariable: 'username')]) {
                sh '''
                docker login -u $username -p $password
                docker push ktao329/showcase_flask_app
                '''
                }
            }
        }
        stage("deploy to ec2"){
            steps{
                withCredentials([aws(accessKeyVariable: 'AWS_ACCESS_KEY_ID', credentialsId:'aws_credential', secretKeyVariable: 'AWS_SECRET_ACCESS_KEY')]){
                    sh '''
                    aws ecs update-service --cluster "our-cluster" --service "python-service" --force-new-deployment --region eu-west-1
                '''
                }
                
            }
        }
        stage("clean up"){
            steps{
                cleanWs()
            }
        }
    }
}