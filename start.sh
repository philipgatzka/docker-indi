#!/bin/bash
docker run -d --rm -p 7624:7624 \
  --name indisrv \
  --device /dev/bus/usb \
  --device /dev/ttyS0 \
  indisrv
