# Repeatable build environment for building Remmina

```
docker run --rm -ti -v /tmp/.X11-unix:/tmp/.X11-unix -v $HOME:/root -e DISPLAY=unix$DISPLAY transistor1/build_remmina bash
```

