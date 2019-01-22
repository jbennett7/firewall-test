pipeline {
  agent any
  stages {
    stage('Build') {
      steps {
        sh '''
                    echo "PATH = ${PATH}"
                    echo "M2_HOME = ${M2_HOME}"
                    bash prime-maven-repo-compliance-libs.sh
                    bash prime-npm-repo.sh
                    bash prime-pypi-repo.sh '''
      }
    }
    stage('Scan App - Build Container') {
      parallel {
        stage('IQ-BOM') {
          steps {
            nexusPolicyEvaluation(iqApplication: 'webgoat8', iqStage: 'build', iqScanPatterns: [[scanPattern: '']])
          }
        }
        stage('Static Analysis') {
          steps {
            echo '...run SonarQube or other SAST tools here'
          }
        }
        stage('Build Container') {
          steps {
             echo '... Build docker image here'
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
             echo '...another IQ Scan of Container or other things here'
          }
        }
      }
    }
    stage('Publish Container') {
      when {
        branch 'master'
      }
      steps {
        sh '''
                   Echo "More Stuff here - Publish Stage"
                '''
      }
    }
  }
  tools {
    maven 'M3'
  }
}