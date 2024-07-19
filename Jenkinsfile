pipeline { 

    environment { 
        registry = "techaxis/lemp" 
        registryCredential = 'dockerhub' 
        dockerImage = '' 
    }

    agent any 

    stages { 

        stage('Cloning our Git') { 
            steps { 
                git branch: 'devops', url: 'https://github.com/techaxis-devops-11/lemp.git'
            }
        } 

        stage('Building our image') { 
            steps { 
                script { 
                    dockerImage = docker.build registry + ":$BUILD_NUMBER" 
                }
            } 
        }

        stage('Push image to Dockerhub') { 
            steps { 
                script { 
                    docker.withRegistry( '', registryCredential ) { 
                        dockerImage.push() 
                    }
                } 
            }
        } 

        stage('Cleaning up') { 
            steps { 
                sh "docker rmi $registry:$BUILD_NUMBER" 
            }
        } 

        stage('Run Docker container on remote hosts') {
            steps {
                sh 'docker -H ssh://ubuntu@54.90.77.91 run -d -p 4000:80 --name=lemp techaxis/lemp:$BUILD_NUMBER'
            }
        }
    
    }

}

