# Containerized OVOS Development Environment

Installing containerized ovos with podman-compose.

The [Standard OVOS Installer](https://github.com/OpenVoiceOS/ovos-installer) works great for an end-device, since it handles system setup with a nice ansible playbook.  However, those changes are not desirable for installing to a development environment.

Instead, we would like to use podman and podman-compose to start
up and shut down the required containers.  These tools run in user-mode, with better priveledge separations.

I am testing this on an Ubuntu 22 laptop with pulse audio and
gnome/wayland desktop.

## Pre-requisites

podman and podman-compose.  I am using podman-compose version 1.5.0 and podman version 5.7.1.  Podman-compose is a python package that can be pip-installed.

## Setup instructions

- setup env vars

      id # get your user and group ID-s to put in .env, below
      vi .env
      # Note: set BASE_DIR to $HOME/ovos/volumes
      # if following these instructions

- build container images

      bash build.sh

- make config/data directories

      mkdir -p $HOME/ovos/volumes/{config,data,nltk_data,state,tmp}
      mkdir $HOME/ovos/volumes/config/mycroft

- create config file

      cp mycroft.conf $HOME/ovos/volumes/config/mycroft

  For more options / explanations, see [ovos-config](https://github.com/OpenVoiceOS/ovos-config).

- test mapping of user ID into containers

    % podman run --userns keep-id:uid=1000,gid=1000 -d -v ../../config/mycroft:/home/ovos/.config/mycroft --name messagebus jarbasai/ovos-messagebus
    % podman exec -it messagebus /bin/bash
    ovos@messagebus:~$ id
    uid=1000(ovos) gid=1000(ovos) groups=1000(ovos)
    ovos@messagebus:~$ ls -l
    total 4
    -rwxr-xr-x 1 ovos ovos 1059 Dec 31 04:09 ovos-hc
    ovos@messagebus:~$ ls -l .config/
    total 4
    drwxr-xr-x 2 ovos ovos 4096 Jan  2 16:16 mycroft

  The user/group of the files inside .config should both be "ovos".


## Run instructions

- individual container:

      podman run (as above)

- whole collection:

      cd core
      podman network create ovos-net # needed only once
                                     # used in the compose file
      podman-compose up

  I am starting with testing the core services first, and will
  add more containerized services once those are working.


## Development instructions

- Modify config file ~> restart containers.

- Modify component packages ~> rebuild corresponding image ~> restart container.

- Create integration tests ~> run with ???

