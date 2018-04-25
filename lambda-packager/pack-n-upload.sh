#!/bin/bash

set -e
OUTPUT_FILE='package.zip'

cd "${BITBUCKET_CLONE_DIR}/app"
if [ -e requirements.txt ]; then
   if [ "${PY_LOCAL_PATH}x" == "x" ]; then
     PY_LOCAL_PATH="lib"
   fi
   pip install -r requirements.txt -t "${PY_LOCAL_PATH}"
   sudo find . -name __pycache__ -delete
   chmod -R 0777 $(pwd)
   zip -r "${OUTPUT_FILE}" $(ls *.py) "${PY_LOCAL_PATH}"
else
   zip "${OUTPUT_FILE}" $(ls *.py)
fi

pwd
ls -Alh $(pwd)
