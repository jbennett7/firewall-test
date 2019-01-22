#!/bin/bash

usage() {
  echo "Usage: $0 [-v <2|3>] [-p <port>] [-m <max>]"
}

PORT=8081
VERSION=3
MAX=-1

while getopts "v:p:m:" option; do
  case "${option}" in
    v)
      VERSION=${OPTARG}
      if [ "$VERSION" -ne "2" -a "$VERSION" -ne "3" ]; then
        usage
        exit
      fi
      ;;
    p)
      PORT=${OPTARG}
      ;;
    m)
      MAX=${OPTARG}
      ;;
    *)
      usage
      exit
      ;;
  esac
done

case "${VERSION}" in
  2)
    REPO_URL=http://nexus:$PORT/nexus/content/groups/public/
    ;;
  3)
    REPO_URL=http://nexus:8081/repository/central/
    ;;
esac

COUNT=0;
function getPackage() {
  COUNT=$(($COUNT+1))
  if [[ ($MAX -ne -1) && ($COUNT -gt $MAX) ]]; then
    exit
  fi

  # download with curl but make it quiet in terms of output
  echo "Priming Maven: $1"
  wget $REPO_URL$1 
}

getPackage org/springframework/boot/spring-boot-starter-data-mongodb/2.0.5.RELEASE/spring-boot-starter-data-mongodb-2.0.5.RELEASE.jar
getPackage org/springframework/boot/spring-boot-starter-data-mongodb/2.0.5.RELEASE/spring-boot-starter-data-mongodb-2.0.5.RELEASE.pom
getPackage org/springframework/boot/spring-boot-starter-web-services/2.0.5.RELEASE/spring-boot-starter-web-services-2.0.5.RELEASE.jar
getPackage org/springframework/boot/spring-boot-starter-web-services/2.0.5.RELEASE/spring-boot-starter-web-services-2.0.5.RELEASE.pom
getPackage org/springframework/boot/spring-boot-starter-test/2.0.5.RELEASE/spring-boot-starter-test-2.0.5.RELEASE.jar
getPackage org/springframework/boot/spring-boot-starter-test/2.0.5.RELEASE/spring-boot-starter-test-2.0.5.RELEASE.pom
getPackage aopalliance/aopalliance/1.0/aopalliance-1.0.jar
getPackage org/camunda/bpm/extension/camunda-bpm-mail-core/1.1.0/camunda-bpm-mail-core-1.1.0.jar
getPackage org/camunda/bpm/model/camunda-cmmn-model/7.9.0/camunda-cmmn-model-7.9.0.jar
getPackage org/camunda/commons/camunda-commons-logging/1.5.0/camunda-commons-logging-1.5.0.jar
getPackage org/camunda/commons/camunda-commons-typed-values/1.5.0/camunda-commons-typed-values-1.5.0.jar
getPackage org/camunda/commons/camunda-commons-utils/1.5.0/camunda-commons-utils-1.5.0.jar
getPackage org/camunda/connect/camunda-connect-connectors-all/1.0.6/camunda-connect-connectors-all-1.0.6.jar
getPackage org/camunda/connect/camunda-connect-core/1.0.6/camunda-connect-core-1.0.6.jar
getPackage org/camunda/bpm/model/camunda-dmn-model/7.9.0/camunda-dmn-model-7.9.0.jar
getPackage org/camunda/bpm/camunda-engine/7.9.0/camunda-engine-7.9.0.jar
getPackage org/camunda/bpm/dmn/camunda-engine-dmn/7.9.0/camunda-engine-dmn-7.9.0.jar
getPackage org/camunda/bpm/dmn/camunda-engine-feel-api/7.9.0/camunda-engine-feel-api-7.9.0.jar
getPackage org/camunda/bpm/dmn/camunda-engine-feel-juel/7.9.0/camunda-engine-feel-juel-7.9.0.jar
getPackage org/camunda/bpm/camunda-engine-plugin-connect/7.9.0/camunda-engine-plugin-connect-7.9.0.jar
getPackage org/camunda/bpm/camunda-engine-plugin-spin/7.9.0/camunda-engine-plugin-spin-7.9.0.jar
getPackage org/camunda/bpm/camunda-engine-spring/7.9.0/camunda-engine-spring-7.9.0.jar
getPackage org/camunda/bpm/camunda-identity-ldap/7.9.0/camunda-identity-ldap-7.9.0.jar
getPackage org/camunda/bpm/camunda-spin-core/1.5.1/camunda-spin-core-1.5.1.jar
getPackage org/camunda/bpm/camunda-spin-dataformat-all/1.5.1/camunda-spin-dataformat-all-1.5.1.jar
getPackage org/camunda/bpm/camunda-template-engines-freemarker/1.0.1/camunda-template-engines-freemarker-1.0.1.jar
getPackage org/camunda/bpm/model/camunda-xml-model/7.9.0/camunda-xml-model-7.9.0.jar
getPackage org/springframework/spring-aop/3.1.2.RELEASE/spring-aop-3.1.2.RELEASE.jar
getPackage org/springframework/spring-asm/3.1.2.RELEASE/spring-asm-3.1.2.RELEASE.jar
getPackage org/springframework/spring-beans/3.1.2.RELEASE/spring-beans-3.1.2.RELEASE.jar
getPackage org/springframework/spring-context/3.1.2.RELEASE/spring-context-3.1.2.RELEASE.jar
getPackage org/springframework/spring-context-support/3.1.2.RELEASE/spring-context-support-3.1.2.RELEASE.jar
getPackage org/springframework/spring-core/3.1.2.RELEASE/spring-core-3.1.2.RELEASE.jar
getPackage org/springframework/spring-expression/3.1.2.RELEASE/spring-expression-3.1.2.RELEASE.jar
getPackage org/springframework/spring-jdbc/3.1.2.RELEASE/spring-jdbc-3.1.2.RELEASE.jar
getPackage org/springframework/spring-orm/3.1.2.RELEASE/spring-orm-3.1.2.RELEASE.jar
getPackage org/springframework/spring-tx/3.1.2.RELEASE/spring-tx-3.1.2.RELEASE.jar
getPackage org/springframework/spring-web/3.1.2.RELEASE/spring-web-3.1.2.RELEASE.jar
getPackage org/springframework/spring-webmvc/3.1.2.RELEASE/spring-webmvc-3.1.2.RELEASE.jar
getPackage org/slf4j/slf4j-api/1.7.21/slf4j-api-1.7.21.jar
getPackage org/slf4j/slf4j-jdk14/1.7.21/slf4j-jdk14-1.7.21.jar
getPackage commons-dbcp/commons-dbcp/1.4/commons-dbcp-1.4.jar
getPackage commons-lang/commons-lang/2.4/commons-lang-2.4.jar
getPackage commons-logging/commons-logging/1.1.1/commons-logging-1.1.1.jar
getPackage commons-pool/commons-pool/1.5.4/commons-pool-1.5.4.jar
getPackage com/fasterxml/jackson/core/jackson-annotations/2.9.0/jackson-annotations-2.9.0.jar
getPackage com/fasterxml/jackson/core/jackson-core/2.9.7/jackson-core-2.9.7.jar
getPackage com/fasterxml/jackson/core/jackson-databind/2.9.7/jackson-databind-2.9.7.jar
getPackage com/microsoft/sqlserver/mssql-jdbc/6.4.0/mssql-jdbc-6.4.0.jre8.jar
getPackage mysql/mysql-connector-java/8.0.13/mysql-connector-java-8.0.13.jar
getPackage com/oracle/ojdbc6/11.2.0/ojdbc6-11.2.0.jar

