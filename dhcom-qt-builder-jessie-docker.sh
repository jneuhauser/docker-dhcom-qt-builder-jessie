#!/usr/bin/env bash
set -euo pipefail

## config
SCRIPT_NAME="arm-linaro-gcc7-docker.sh"
DOCKER_IMAGE="jneuhauser/arm-linaro-gcc7"
INSTALL_PATH="/usr/local/bin"
INSTALL_CMDS=(
arm-linux-gnueabihf-addr2line
arm-linux-gnueabihf-ar
arm-linux-gnueabihf-as
arm-linux-gnueabihf-c++
arm-linux-gnueabihf-c++filt
arm-linux-gnueabihf-cpp
arm-linux-gnueabihf-dwp
arm-linux-gnueabihf-elfedit
arm-linux-gnueabihf-g++
arm-linux-gnueabihf-gcc
arm-linux-gnueabihf-gcc-7.4.1
arm-linux-gnueabihf-gcc-ar
arm-linux-gnueabihf-gcc-nm
arm-linux-gnueabihf-gcc-ranlib
arm-linux-gnueabihf-gcov
arm-linux-gnueabihf-gcov-dump
arm-linux-gnueabihf-gcov-tool
arm-linux-gnueabihf-gdb
arm-linux-gnueabihf-gdb-add-index
arm-linux-gnueabihf-gfortran
arm-linux-gnueabihf-gprof
arm-linux-gnueabihf-ld
arm-linux-gnueabihf-ld.bfd
arm-linux-gnueabihf-ld.gold
arm-linux-gnueabihf-nm
arm-linux-gnueabihf-objcopy
arm-linux-gnueabihf-objdump
arm-linux-gnueabihf-ranlib
arm-linux-gnueabihf-readelf
arm-linux-gnueabihf-size
arm-linux-gnueabihf-strings
arm-linux-gnueabihf-strip
arm-linux-gnueabi-addr2line
arm-linux-gnueabi-ar
arm-linux-gnueabi-as
arm-linux-gnueabi-c++
arm-linux-gnueabi-c++filt
arm-linux-gnueabi-cpp
arm-linux-gnueabi-dwp
arm-linux-gnueabi-elfedit
arm-linux-gnueabi-g++
arm-linux-gnueabi-gcc
arm-linux-gnueabi-gcc-7.4.1
arm-linux-gnueabi-gcc-ar
arm-linux-gnueabi-gcc-nm
arm-linux-gnueabi-gcc-ranlib
arm-linux-gnueabi-gcov
arm-linux-gnueabi-gcov-dump
arm-linux-gnueabi-gcov-tool
arm-linux-gnueabi-gdb
arm-linux-gnueabi-gdb-add-index
arm-linux-gnueabi-gfortran
arm-linux-gnueabi-gprof
arm-linux-gnueabi-ld
arm-linux-gnueabi-ld.bfd
arm-linux-gnueabi-ld.gold
arm-linux-gnueabi-nm
arm-linux-gnueabi-objcopy
arm-linux-gnueabi-objdump
arm-linux-gnueabi-ranlib
arm-linux-gnueabi-readelf
arm-linux-gnueabi-size
arm-linux-gnueabi-strings
arm-linux-gnueabi-strip
)

## do not edit
CMD=${0##*/}
ARGS=${@}
WDIR=$(pwd)

if [ "${CMD}" = "${SCRIPT_NAME}" ] ; then
  case "${ARGS}" in
  "install")
    SCRIPT_PATH=$(readlink -f ${SCRIPT_NAME})
    for cmd in ${INSTALL_CMDS[*]} ; do
      echo "Installing ${INSTALL_PATH}/${cmd}"
      ln -sf ${SCRIPT_PATH} ${INSTALL_PATH}/${cmd}
    done
  ;;
  "deinstall")
    for cmd in ${INSTALL_CMDS[*]} ; do
      echo "Removing ${INSTALL_PATH}/${cmd}"
      rm -f ${INSTALL_PATH}/${cmd}
    done
  ;;
  *)
    echo "Call me with \"install\" to install symlinks to ${INSTALL_PATH} or"
    echo "call me with \"deinstall\" to remove symlinks from ${INSTALL_PATH}"
  ;;
  esac
  exit 1
fi

docker run --interactive --rm \
  --workdir "${WDIR}" \
  --volume "${WDIR}":"${WDIR}" \
  --user $(id -u):$(id -g) \
  ${DOCKER_IMAGE} \
  ${CMD} ${ARGS}
