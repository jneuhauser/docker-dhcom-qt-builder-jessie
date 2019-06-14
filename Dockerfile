FROM jneuhauser/debian-jessie-crossbuild-base:20180601T043106Z-snapshot

RUN	apt-get -y install \
		# 4. Cross-Compiler-Toolchain
		crossbuild-essential-armhf \
		crossbuild-essential-armel \
		gdb-multiarch \
		# 7. Feintuning und letzte Anpassungen - Installation von Pakete zum Bau von Qt
		flex \
		gperf \
		bison \
		# 7. Feintuning und letzte Anpassungen - Installation von Qt Creator
		libglib2.0-0:armhf

CMD [ "/bin/bash" ]
