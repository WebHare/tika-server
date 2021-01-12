#!/bin/bash

while true; do
  PIDS="$(pgrep --parent 1 '^tesseract$')"
  if [ -n "$PIDS" ]; then
    kill $PIDS
  fi
  sleep 60
done
