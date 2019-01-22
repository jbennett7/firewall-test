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
    stage('Maven') {
      steps {
        sh '''
                    bash prime-maven-repo-compliance-libs.sh
           '''
          }
        }
     stage('Create tar') {
       steps { 
        sh ''' 
                    tar cvzf java-dependencies.tar.gz *.jar && rm *.jar *.pom

           ''' 
        }
     }
     stage('Nexus Lifecycle Eval') {
       steps {
          nexusPolicyEvaluation(iqApplication: 'test-components-la', iqStage: 'build', iqScanPatterns: [[scanPattern: '']])
       }
     }
     stage('Clean Up') {
       steps { 
         sh ''' 
                    rm *.tar.gz 
            '''
         }
     }
   }
}

