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
    stage('Test Container') {
      parallel {
        stage('Test Container') {
          steps {
            catchError() {
              echo 'Test Container here'
            }

          }
        }
        stage('IQ-Scan Container') {
          steps {
            echo "... Insert Tar/Scan stuff here"
          }
        }
      }
    }
    stage('Publish Container') {
      when {
        branch 'master'
      }
      steps {
        echo " ...More to come here"
      }
    }
  }
}
