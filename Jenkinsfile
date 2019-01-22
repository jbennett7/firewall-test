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
      parallel {
        stage('NPM') {
          steps {
            sh '''bash prime-npm-repo.sh
            npm install --registry=http://nexus:8081/repository/npm/ --prefix . @angular/animations@7.1.0 --loglevel error
            npm install --registry=http://nexus:8081/repository/npm/ --prefix . @angular/animations@7.1.3 --loglevel error
            npm install --registry=http://nexus:8081/repository/npm/ --prefix . @angular/animations@6.1.7 --loglevel error



            '''
            }
        }
        stage('Maven') {
          steps {
            sh '''bash prime-maven-repo-compliance-libs.sh'''
          }
        }
        stage('PyPi') {
          steps {
            sh '''bash prime-pypi-repo.sh'''
          }
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