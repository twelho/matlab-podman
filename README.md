# Run Matlab in Rootless Podman with Toolboxes

This tooling extends the official Matlab Docker image by installing
GCC and allowing the installation of toolboxes during setup. 

## Dependencies

- A [rootless Podman] environment (rootful Podman and Docker are not supported)
  - Docker Hub must be configured as a registry, i.e. `podman pull alpine` must work
- `xdg-open` for launching a web browser of choice
- `xhost` for X11 forwarding
- `make` for building and running

[rootless Podman]: https://github.com/containers/podman/blob/main/docs/tutorials/rootless_tutorial.md

## Usage

1. Clone this repo into your Matlab project directory
   (it will be mounted as the working directory inside the container).
3. Run `make build` to create the `matlab-gcc` image.
4. Run `make create` and follow the instructions to
   1. update the the `matlab-gcc` image with credentials and toolboxes and
   2. create the `matlab` working container.
5. Run `make (run)` to start the persistent `matlab` container. Note that you
   will be asked to authenticate if the session has expired since the last start.

## Maintainers

- Dennis Marttinen ([@twelho](https://github.com/twelho))
