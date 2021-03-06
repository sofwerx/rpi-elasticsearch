#!/bin/bash -e
. .env
docker pull ${TRAVIS_REPO_SLUG}:latest || true
docker build \
  --build-arg ELASTICSEARCH_VERSION=$ES_VERSION \
  --build-arg ELASTICSEARCH_TARBALL_SHA1=$ES_SHA1 \
  --build-arg XPACK_VERSION=$XP_VERSION \
  --build-arg XPACK_TARBALL_SHA1=$XP_SHA1 \
  --cache-from ${TRAVIS_REPO_SLUG}:latest \
  -t ${TRAVIS_REPO_SLUG}:latest \
  .
