FROM jneuhauser/debian-jessie-crossbuild-base:20180601T043106Z-snapshot

RUN	apt-get -y install \
		crossbuild-essential-armhf \
		crossbuild-essential-armel \
		gdb-multiarch

CMD [ "/bin/bash" ]
