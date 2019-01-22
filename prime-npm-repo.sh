#!/bin/sh

usage() {
  echo "Usage: $0 [-v <2|3>] [-p <port>] [-m <max>]"
}

PORT=8090
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
      ;;
  esac
done

if [ -z "${VERSION}" ]; then
  usage
  exit
fi

case "${VERSION}" in
  2)
    registry="http://nexus:8090/repository/npm-proxy/"
    ;;
  3)
    registry="http://nexus:8081/repository/npm/"
    ;;
esac

# if there is a problem in your .npmrc config, these settings help avoid long pauses between installs
npmargs="--fetch-retry-maxtimeout=5 --fetch-retry-mintimeout=2 --fetch-retry=1 --fetch-retry-factor=1"

COUNT=0;
function getPackage() {
  COUNT=$(($COUNT+1))
  if [[ ($MAX -ne -1) && ($COUNT -gt $MAX) ]]; then
    exit
  fi

  echo "Priming NPM: $1"
  npm ${npm_args} --registry=${registry} install --prefix . $1 --loglevel error
}

# following are a number of packages and version specific packages with security/license issues

getPackage @angular/animations@7.1.0
getPackage @angular/animations@7.1.3
getPackage @angular/animations@6.1.7
getPackage @angular/cdk@~7.2.0
getPackage @angular/cdk@7.1.1
getPackage @angular/cdk@7.0.0-beta.0
getPackage @angular/cli@~7.1.4
getPackage @angular/cli@7.1.3
getPackage @angular/cli@6.2.1
getPackage @angular/common@7.1.4
getPackage @angular/common@7.1.3
getPackage @angular/common@6.1.7
getPackage @angular/compiler@7.1.0
getPackage @angular/compiler@7.1.3
getPackage @angular/compiler@6.1.7
getPackage @angular/compiler-cli@7.1.0
getPackage @angular/compiler-cli@7.1.3
getPackage @angular/compiler-cli@6.1.7
getPackage @angular/core@7.1.0
getPackage @angular/core@7.1.3
getPackage @angular/core@6.1.7
getPackage @angular/forms@7.1.0
getPackage @angular/forms@7.1.3
getPackage @angular/forms@6.1.7
getPackage @angular/http@7.1.3
getPackage @angular/http@6.1.7
getPackage @angular/language-service@7.1.0
getPackage @angular/language-service@7.1.3
getPackage @angular/language-service@6.1.7
getPackage @angular/material@7.0.3
getPackage @angular/material@7.1.1
getPackage @angular/material@7.0.0-beta.0
getPackage @angular/platform-browser@7.1.0
getPackage @angular/platform-browser@7.1.3
getPackage @angular/platform-browser@6.1.7
getPackage @angular/platform-browser-dynamic@7.1.0
getPackage @angular/platform-browser-dynamic@7.1.3
getPackage @angular/platform-browser-dynamic@6.1.7
getPackage @angular/pwa@0.11.4
getPackage @angular/pwa@0.11.3
getPackage @angular/router@7.1.0
getPackage @angular/router@7.1.3
getPackage @angular/router@6.1.7
getPackage @angular/service-worker@7.1.3
getPackage @angular/service-worker@6.1.7
getPackage @angular-devkit/build-angular@~0.11.4
getPackage @angular-devkit/build-angular@0.11.3
getPackage @angular-devkit/build-angular@~0.8.0
getPackage @angular-devkit/build-ng-packagr@~0.11.4
getPackage @compodoc/compodoc@1.1.6
getPackage @compodoc/compodoc@1.1.5
getPackage @ngrx/effects@~7.0.0
getPackage @ngrx/effects@6.0.1
getPackage @ngrx/entity@6.0.1
getPackage @ngrx/router-store@~7.0.0
getPackage @ngrx/router-store@6.0.1
getPackage @ngrx/schematics@6.0.1
getPackage @ngrx/store@~7.0.0
getPackage @ngrx/store@6.0.1
getPackage @ngrx/store-devtools@~7.0.0
getPackage @ngrx/store-devtools@6.0.1
getPackage @nrwl/nx@~7.1.1
getPackage @nrwl/schematics@~7.1.1
getPackage @types/jasmine@~3.3.4
getPackage @types/jasmine@~3.3.1
getPackage @types/jasmine@~2.8.3
getPackage @types/jasminewd2@~2.0.3
getPackage @types/jasminewd2@~2.0.2
getPackage @types/node@~10.12.18
getPackage @types/node@~10.12.15
getPackage @types/node@~6.0.60
getPackage classlist.js@1.1.20150312
getPackage codelyzer@~4.5.0
getPackage codelyzer@4.0.1
getPackage copy-webpack-plugin@4.5.1
getPackage core-js@2.5.4
getPackage core-js@2.4.1
getPackage extract-text-webpack-plugin@4.0.0-beta.0
getPackage hammerjs@2.0.8
getPackage html-minifier@3.5.18
getPackage html-minifier@3.5.15
getPackage html-webpack-plugin@3.2.0
getPackage husky@1.1.4
getPackage husky@1.2.1
getPackage husky@0.14.3
getPackage jasmine-core@~3.3.0
getPackage jasmine-core@~2.8.0
getPackage jasmine-marbles@~0.4.0
getPackage jasmine-spec-reporter@~4.2.1
getPackage karma@~3.1.4
getPackage karma@~3.1.3
getPackage karma@~2.0.0
getPackage karma-chrome-launcher@~2.2.0
getPackage karma-coverage-istanbul-reporter@~2.0.1
getPackage karma-coverage-istanbul-reporter@~2.0.0
getPackage karma-coverage-istanbul-reporter@1.2.1
getPackage karma-jasmine@~2.0.1
getPackage karma-jasmine@~1.1.0
getPackage karma-jasmine-html-reporter@1.4.0
getPackage karma-jasmine-html-reporter@0.2.2
getPackage kss@3.0.0-beta.23
getPackage lint-staged@8.1.0
getPackage lint-staged@7.2.2
getPackage michelangelo@0.8.0
getPackage ng-packagr@4.2.0
getPackage ngrx-store-freeze@~0.2.4
getPackage ngx-cookie-service@2.1.0
getPackage ngx-cookie-service@1.0.10
getPackage node-sass@4.9.4
getPackage npm-run-all@4.1.3
getPackage prettier@~1.15.3
getPackage prettier@1.13.7
getPackage prettier@1.12.1
getPackage pretty-quick@1.8.0
getPackage pretty-quick@1.6.0
getPackage protractor@~5.4.0
getPackage protractor@5.4.1
getPackage protractor@~5.1.2
getPackage rxjs@6.0.0
getPackage rxjs@6.3.2
getPackage rxjs-tslint@0.1.5
getPackage stylelint@9.8.0
getPackage stylelint@9.2.0
getPackage stylelint-config-standard@18.2.0
getPackage stylelint-scss@3.1.0
getPackage svg-sprite-loader@4.1.3
getPackage svg-sprite-loader@3.7.3
getPackage sw-precache-webpack-plugin@0.11.5
getPackage tachyons@~4.11.1
getPackage tachyons@4.11.1
getPackage tachyons@4.9.1
getPackage tsickle@~>=0.29.0
getPackage tslib@1.9.0
getPackage tslint@~5.12.0
getPackage tslint@~5.11.0
getPackage tslint@~5.9.1
getPackage ts-node@~7.0.0
getPackage ts-node@~7.0.1
getPackage ts-node@~4.1.0
getPackage typescript@>=3.1.6~<3.2
getPackage typescript@>=3.1.1~<3.2
getPackage typescript@2.5.3
getPackage url-search-params-polyfill@5.0.0
getPackage web-animations-js@2.3.1
getPackage webpack@4.21.0
getPackage zone.js@0.8.26
getPackage zone.js@0.8.19
