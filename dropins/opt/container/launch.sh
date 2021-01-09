#!/bin/bash

exec java -jar /tika-server-${TIKA_VERSION}.jar -config /opt/container/data/tika-config.xml -spawnChild -maxFiles 1000 -h 0.0.0.0 --taskTimeoutMillis 600000 "$@"
