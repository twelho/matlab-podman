ARG MATLAB_RELEASE

FROM mathworks/matlab:${MATLAB_RELEASE}

RUN	export DEBIAN_FRONTEND=noninteractive && sudo -E bash -c ' \
	apt-get update && apt-get -y --no-install-recommends install gcc-9 g++-9 && \
	update-alternatives --install /usr/bin/g++ g++ /usr/bin/g++-9 10 && \
	update-alternatives --install /usr/bin/gcc gcc /usr/bin/gcc-9 10'
