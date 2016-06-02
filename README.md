# Repeatable build environment for building Remmina

Based on Ubuntu 16.04 instructions (here)[https://github.com/FreeRDP/Remmina/wiki/Compile-on-Ubuntu-16.04]

```

docker run --rm -ti -v /tmp/.X11-unix:/tmp/.X11-unix -v $HOME:/root -e DISPLAY=unix$DISPLAY transistor1/build_remmina bash

root@c4453aa58cc4:/# /build.sh


```

