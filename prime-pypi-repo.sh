#!/bin/bash

usage() {
  echo "Usage: $0 [-p <port>]"
}

PORT=8081
REPO="pypi"
VERBOSE=""

while getopts "v:p:r:" option; do
  case "${option}" in
    v)
      VERBOSE="-v"
      ;;
    p)
      PORT=${OPTARG}
      ;;
    r)
      REPO=${OPTARG}
      ;;
    *)
      usage
      exit
      ;;
  esac
done

REPO_URL="http://nexus:$PORT"

TEMPDIR="/tmp/prime-pypi"
echo "Using temporary work folder $TEMPDIR"
mkdir -p $TEMPDIR
cd $TEMPDIR

echo "Initializing virtualenv"
rm -rf py27
virtualenv py27 --python=python2.7
cd py27
source ./bin/activate

cat > pip.conf << FILE
[global]
index = $REPO_URL/repository/$REPO/pypi
index-url = $REPO_URL/repository/$REPO/simple
FILE


echo "Installing wheel package with specific version 'pyglet==1.2.0', this should now show in Nexus"
pip $VERBOSE install pyglet==1.2.0
pip $VERBOSE install agate==1.6.1
pip $VERBOSE install agate-dbf==0.2.0
pip $VERBOSE install agate-excel==0.2.2
pip $VERBOSE install agate-sql==0.5.3
pip $VERBOSE install astroid==2.1.0
pip $VERBOSE install atomicwrites==1.2.1
pip $VERBOSE install attrs==18.2.0
pip $VERBOSE install Babel==2.6.0
pip $VERBOSE install Click==7
pip $VERBOSE install colorama== 0.4.1
pip $VERBOSE install coverage== 4.5.2
pip $VERBOSE install csvkit==1.0.3
pip $VERBOSE install dbfread==2.0.7
pip $VERBOSE install et-xmlfile==1.0.1
pip $VERBOSE install Flask==1.0.2
pip $VERBOSE install Flask-Cors==3.0.7
pip $VERBOSE install flask-marshmallow==0.9.0
pip $VERBOSE install Flask-MongoAlchemy==0.7.2
pip $VERBOSE install Flask-PyMongo==2.2.0
pip $VERBOSE install Flask-SQLAlchemy==2.3.2
pip $VERBOSE install future==0.17.1
pip $VERBOSE install isodate==0.6.0
pip $VERBOSE install isort==4.3.4
pip $VERBOSE install itsdangerous==1.1.0
pip $VERBOSE install jdcal==1.4
pip $VERBOSE install Jinja2==2.1
pip $VERBOSE install lazy-object-proxy==1.3.1
pip $VERBOSE install leather==0.3.3
pip $VERBOSE install MarkupSafe==1.1.0
pip $VERBOSE install marshmallow==2.17.0
pip $VERBOSE install marshmallow-sqlalchemy==0.15.0
pip $VERBOSE install mccabe==0.6.1
pip $VERBOSE install MongoAlchemy==0.19
pip $VERBOSE install more-itertools==5.0.0
pip $VERBOSE install openpyxl==2.5.12
pip $VERBOSE install parsedatetime==2.4
pip $VERBOSE install pip==18.1
pip $VERBOSE install pluggy==0.8.0
pip $VERBOSE install py==1.7.0
pip $VERBOSE install pylint==2.2.2
pip $VERBOSE install pylint-flask==0.5
pip $VERBOSE install pylint-plugin-utils==0.4
pip $VERBOSE install pymongo==3.7.2
pip $VERBOSE install pytest==4.0.2
pip $VERBOSE install python-slugify==2.0.1
pip $VERBOSE install pytimeparse==1.1.8
pip $VERBOSE install pytz==2018.7
pip $VERBOSE install setuptools==40.6.2
pip $VERBOSE install six==1.12.0
pip $VERBOSE install SQLAlchemy==1.2.15
pip $VERBOSE install Unidecode==1.0.23
pip $VERBOSE install Werkzeug==0.14.1
pip $VERBOSE install wrapt==1.10.11
pip $VERBOSE install xlrd==1.2.0
pip $VERBOSE install flask-mongoengine==0.9.5

deactivate
