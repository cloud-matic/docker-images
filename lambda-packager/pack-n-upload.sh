#!/bin/bash

set -e

cd "${BITBUCKET_CLONE_DIR}/app"
if [ -e requirements.txt ]; then
   if [ "${PY_LOCAL_PATH}x" == "x" ]; then
     PY_LOCAL_PATH="lib"
   fi
   pip install -r requirements.txt -t "${PY_LOCAL_PATH}"
   sudo find . -name __pycache__ -delete
fi
chmod -R 0777 $(pwd)
zip -r package.zip $(ls *.py) "${PY_LOCAL_PATH}"
pwd
ls -Alh package.zip
