# Repeatable build environment for building Remmina

Based on Ubuntu 16.04 instructions [here](https://github.com/FreeRDP/Remmina/wiki/Compile-on-Ubuntu-16.04)

# Compiling the Remmina Next Branch #

First, [install Docker](https://docs.docker.com/engine/installation/), then run the following:

```
sudo docker run --rm -ti -v /tmp/.X11-unix:/tmp/.X11-unix -v $HOME:/root -e DISPLAY=unix$DISPLAY transistor1/remmina_devel bash
```


**Note**: change `transistor1/remmina_devel` to `transistor1/remmina_devel:jessie` if you're building for Debian Jessie.

You'll be dropped into a `bash` shell within the Docker container.  Then, run:

```
/build.sh
```


All of the source should be downloaded automatically, and as long as both the `freerdp` and the `remmina` master branches are not broken, it should automatically compile the `next` branch of both.

When you're asked any questions, simply press `Enter` to select the defaults.  This is just `checkinstall` building some simple `.deb` packages for you.

You may get error messages like these; there is no need to worry about them:

```
** (remmina:24462): WARNING **: Could not open X display
No protocol specified
Unable to init server: Could not connect: Connection refused

(remmina:24462): Gtk-WARNING **: cannot open display: unix:0.0
```


After building, when you `exit` the Docker container, you should see a new folder, `remmina_devel`, in your user's $HOME directory, with subfolders `FreeRDP` and `Remmina`.  In them, there will be a `freerdp_YYYYMMDD-1_amd64.deb`, and a `remmina_YYYYMMDD-1_amd64.deb`, respectively.

You can then install these .debs on your host system.  Just be aware that they don't have any dependency information baked in, so you will probably have to install other packages in order to get them to work.  To get an idea of some of the libraries you may need, see my Dockerfile source [for Debian](https://github.com/transistor1/remmina_devel/blob/debian-jessie/Dockerfile), or for [Ubuntu 16.04](https://github.com/transistor1/remmina_devel/blob/master/Dockerfile).

If the source doesn't build, you can try checking out a different branch in the FreeRDP and Remmina sources, and the run `/build` again.

# Tags #

transistor1/remmina_devel:latest - Ubuntu latest

transistor1/remmina_devel:jessie - Debian jessie
