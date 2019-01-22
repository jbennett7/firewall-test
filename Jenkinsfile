pipeline {
  agent any
  stages {
    stage('Build') {
      steps {
        sh '''
                    echo "PATH = ${PATH}"
                    echo "M2_HOME = ${M2_HOME}"
           '''
      }
    } 
    stage('Download Components') {
        stage('Maven') {
          steps {
            sh '''bash prime-maven-repo-compliance-libs.sh'''
          }
        }
    }
    
  }
}
