#!/bin/bash
cd ${BASH_SOURCE%/*}

if [ "$1" == "--push" ]; then
  push=1
  shift
fi
if [ "$1" == "--push-if-pushed" ]; then
  if [ "$CI_PIPELINE_SOURCE" == "push" ]; then
    push=1
  fi
  shift
fi

TAG=registry.gitlab.com/webhare/services/tika-server:devbuild
if ! docker build -t $TAG . ; then
  exit 1
fi

if [ "$push" != "1" ]; then
  echo "NOT pushing $TAG"
elif ! docker push $TAG ; then
  echo "Push of $TAG failed!"
  exit 1
else
  echo "Push of $TAG done"
fi
