#!/bin/sh
sudo docker build -t axyl-artix-build ./

if [ "$?" -ne 0 ]; then
    exit 1
fi

mkdir build pacman-cache
sudo docker run --privileged --mount type=bind,source="$(pwd)"/build,target=/root/artools-workspace/iso --mount type=bind,source="$(pwd)"/pacman-cache,target=/var/cache/pacman/pkg -t axyl-artix-build &&\
echo "Axyl ISO build successful! The ISO was placed in ./build."
