#!/bin/bash

set -e

export OUTPUT_FILE='package.zip'
export BITBUCKET_URL='https://bitbucket.org'

[ -z "$DEPLOY_BUCKET" ] && echo 'Missing varible DEPLOY_BUCKET' && exit 1
[ -z "$DEPLOY_KEYNAME" ] && echo 'Missing varible DEPLOY_KEYNAME' && exit 1
[ -z "$DEPLOY_PATH" ] && echo 'Missing varible DEPLOY_PATH' && exit 1

cd "${BITBUCKET_CLONE_DIR}/app"

jq -n \
       --arg date "$(date -u)" \
       --arg repo "${BITBUCKET_URL}/${BITBUCKET_REPO_OWNER}/${BITBUCKET_REPO_SLUG}" \
       --arg branch "${BITBUCKET_BRANCH}" \
       --arg commit "${BITBUCKET_COMMIT}" \
       --arg build "${BITBUCKET_BUILD_NUMBER}" \
       '{"date":$date, "repo":$repo, "branch":$branch, "commit":$commit, "build":$build}' > build-info.json

if [ -e requirements.txt ]; then
   if [ "${PY_LOCAL_PATH}x" == "x" ]; then
     PY_LOCAL_PATH="lib"
   fi
   pip install --upgrade -r requirements.txt -t "${PY_LOCAL_PATH}"
   sudo find . -name __pycache__ -delete
   chmod -R 0777 $(pwd)
   zip -r "${OUTPUT_FILE}" $(ls *.py) build-info.json "${PY_LOCAL_PATH}"
else
   zip "${OUTPUT_FILE}" $(ls *.py) build-info.json
fi

aws s3 cp ${OUTPUT_FILE} "s3://${DEPLOY_BUCKET}/${DEPLOY_PATH}/${DEPLOY_KEYNAME}/${BITBUCKET_BRANCH}/package.json"
