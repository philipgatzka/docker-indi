#!/usr/bin/env bash
set -euxo pipefail

docker run -d -p 7624:7624 -p 9000:9000 \
  -v "indisrv_config:/root/.indi" \
  --name indisrv \
  --device /dev/bus/usb \
  --device /dev/ttyACM0 \
  --restart="always" \
  indisrv indi_asi_ccd indi_nikon_ccd indi_lx200_OnStep indi_astrometry
