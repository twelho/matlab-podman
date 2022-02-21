MATLAB_RELEASE ?= r2021b

run:
	xhost +
	podman start -ia matlab

create:
	CONTAINER=$$(podman run -qd -p 6080:6080 --shm-size=512M "matlab-gcc:${MATLAB_RELEASE}" -vnc) && \
	xdg-open http://localhost:6080 && \
	read -p "Log in, install toolboxes (as root) and press ENTER to continue... " && \
	podman stop "$$CONTAINER" && \
	podman commit -c CMD=[] "$$CONTAINER" "matlab-gcc:${MATLAB_RELEASE}" && \
	podman rm "$$CONTAINER" && \
	podman create -t -e "DISPLAY=${DISPLAY}" --name matlab \
		--uidmap 1000:0:1 --uidmap 65534:1:1 --uidmap 0:2:125 \
		-v ..:/home/matlab/Documents/MATLAB \
		-v /tmp/.X11-unix:/tmp/.X11-unix:ro \
		--shm-size=512M \
		"matlab-gcc:${MATLAB_RELEASE}"

build:
	podman build --build-arg "MATLAB_RELEASE=${MATLAB_RELEASE}" -t "matlab-gcc:${MATLAB_RELEASE}" .

.PHONY: run create build
