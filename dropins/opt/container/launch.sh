#!/bin/bash

# TODO have someone watch over our killer. wrap in an init?
# TODO we probably need to have cleanup-tesseracts.sh clean out old tmp files too, who else will clean 'm up if the tika-server child dies?
nohup /opt/container/cleanup-tesseracts.sh & # kills tesseracts that linger when the tika server is timing out/aborted/crashed
exec /usr/bin/dumb-init -- java -jar /tika-server-${TIKA_VERSION}.jar -config /opt/container/data/tika-config.xml -spawnChild -maxFiles 1000 -h 0.0.0.0 --taskTimeoutMillis 100000 "$@"
