#!/bin/bash -e
. .env
if [[ $TRAVIS_BRANCH == 'master' && $TRAVIS_PULL_REQUEST == 'false' ]]; then
  docker login -u="$DOCKER_USERNAME" -p="$DOCKER_PASSWORD"
  set -x
  docker tag ${TRAVIS_REPO_SLUG}:latest ${TRAVIS_REPO_SLUG}:${TRAVIS_BUILD_NUMBER} 
  docker tag ${TRAVIS_REPO_SLUG}:latest ${TRAVIS_REPO_SLUG}:v$ES_VERSION
  docker push ${TRAVIS_REPO_SLUG}:latest
  docker push ${TRAVIS_REPO_SLUG}:${TRAVIS_BUILD_NUMBER}
  docker push ${TRAVIS_REPO_SLUG}:v$ES_VERSION
fi
