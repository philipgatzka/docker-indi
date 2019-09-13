#!/bin/bash
docker run --rm -d -p 7624:7624 -p 9000:9000 \
  -v "indisrv_config:/root/.indi" \
  --name indisrv \
  --device /dev/bus/usb \
  --device /dev/ttyS0 \
  --device /dev/ttyUSB0 \
  indisrv indi_asi_ccd indi_arduinost4 indi_simulator_telescope indi_nikon_ccd
