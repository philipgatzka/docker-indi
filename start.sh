#!/bin/bash
docker run --rm -d -p 7624:7624 \
  --name indisrv \
  --device /dev/bus/usb \
  --device /dev/ttyS0 \
  --device /dev/ttyUSB0 \
  indisrv
