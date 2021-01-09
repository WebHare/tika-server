#!/bin/bash

if ! docker run --rm -ti --name test-tika-server \
registry.gitlab.com/webhare/services/tika-server:devbuild \
  /opt/container/launch-and-run-tests.sh ; then
    echo 'TESTS FAILED!'
    exit 1
fi
