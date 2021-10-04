pipeline {
  agent {'aws'}
    stages {
        stage('Preparation') {
            steps {
                // Get some code from a GitHub repository
                git branch:'master', url: 'https://github.com/MohamedOmara-cse/Booster_CI_CD_Project.git'
            }
        }
        stage('Build') {
            steps {
                // Get some code from a GitHub repository
                withCredentials([usernamePassword(credentialsId:"dockerHub",usernameVariable:"username",passwordVariable:"passwd")]){
                sh 'docker build . -t ${username}/django:v1'
                sh 'docker login -u ${username} -p ${passwd}'
                sh 'docker push ${username}/django:v1'
                }
            }
        }  
        stage ('deploy'){
            steps{
                withCredentials([usernamePassword(credentialsId:"dockerhub",usernameVariable:"username",passwordVariable:"pass")]){
                
                sh 'docker run -p 8000:8000 -d ${username}/django:v1'
                }
            }
           // Send notifications
        post {
          success {
                   slackSend (color: "#66ff66" , message: "pipeline succeeded ")
          }
          failure {
                  slackSend (color: "#ff3300", message: "pipeline unsucceeded")
          }
        }
            
        }
    }
}
