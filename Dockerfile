FROM ubuntu:17.10

RUN apt-get update \
	&& apt-get install -y --no-install-recommends software-properties-common git build-essential cmake make \
	&& add-apt-repository -y ppa:mutlaqja/ppa \
	&& apt-get update && apt-get install -y indi-full \
	&& git clone https://github.com/tliff/indi_ardust4 ardust4 \
	&& cd ardust4 \
	&& cmake . \
	&& make \
	&& mv ./indi_ardust4 /usr/bin/indi_ardust4 \
	&& cd .. \
	&& rm -rf ardust4 \
	&& apt-get remove -y software-properties-common git build-essential cmake make \
	&& rm -rf /var/lib/apt/lists/*

COPY ./indi_ardust4.xml /usr/share/indi/indi_ardust4.xml

VOLUME ["indisrv_conf:/root/.indi"]

ENTRYPOINT ["indiserver", "indi_asi_ccd", "indi_ardust4", "indi_simulator_telescope", "indi_gphoto_ccd"]
