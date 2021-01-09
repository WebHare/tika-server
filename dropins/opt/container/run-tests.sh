#!/bin/bash
echo ""
echo "$(date) wait for tika to come online"

CONNECTED=
for i in $(seq 1 100); do
  if ( curl -s http://127.0.0.1:9998/tika/ | grep --silent "Tika Server" ); then
    CONNECTED=1
    break;
  fi
  echo -n "."
  sleep 1
done

if [ -z "$CONNECTED" ]; then
  echo Connection Failed
  exit 1
fi

echo ""
echo "$(date) tika is online"

if ! ( curl -i -H "Accept: text/html" -T /opt/container/data/kleinepdf.pdf http://127.0.0.1:9998/tika | grep --silent "Omgevingsanalyse" ) ; then
  echo "Does not look like OCR is functional"
  exit 1
fi

echo ""
echo "$(date) Tests succeeded"
exit 0
