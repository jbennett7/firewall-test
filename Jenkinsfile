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
  }
}