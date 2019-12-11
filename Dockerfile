FROM ubuntu:18.04

RUN apt update && apt install -y \
  software-properties-common \
  astrometry.net \
  astrometry-data-2mass-03 \
  astrometry-data-2mass-04 \
  astrometry-data-2mass-05 \
  astrometry-data-2mass-06 \
  astrometry-data-2mass-07 \
  astrometry-data-2mass-08-19 && \
  apt-add-repository -y ppa:mutlaqja/ppa && \
  apt update && apt install -y indi-full gsc

VOLUME ["/root/.indi"]

ENTRYPOINT ["indiserver"]
