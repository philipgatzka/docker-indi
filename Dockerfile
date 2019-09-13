FROM ubuntu:18.04

RUN apt update && apt install -y software-properties-common && \
  apt-add-repository -y ppa:mutlaqja/ppa && \
  apt update && apt install -y indi-full gsc

VOLUME ["/root/.indi"]

ENTRYPOINT ["indiserver"]
