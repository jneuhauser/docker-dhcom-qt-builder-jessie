# Development environment for Qt on DHCOM debian jessie in a docker image
This simple docker container contains the emdebian cross toolchains for arm and the custom qt libraries for the DHCOM debian jessie rootfs.

## Usage examples
### Compile hello_world.c in current work dir
```
docker run --interactive --rm \
  --workdir "$(pwd)" \
  --volume "$(pwd)":"$(pwd)" \
  --user $(id -u):$(id -g) \
  jneuhauser/dhcom-qt-builder-jessie:latest \
  arm-linux-gnueabihf-gcc -o hello_world hello_world.c
```
### With helper script "arm-linaro-gcc7-docker.sh"
```
# install symlinks to /usr/local/bin
sudo /path/to/arm-linaro-gcc7-docker.sh install

# use linaro toolchain of docker image
arm-linux-gnueabihf-gcc -o hello_world hello_world.c

# remove symlinks to /usr/local/bin
sudo /path/to/arm-linaro-gcc7-docker.sh deinstall
```
