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
      cp mycroft.conf $HOME/ovos/volumes/config/mycroft

- create config file
- test mapping of user ID into containers

## Run instructions

- individual container: podman run
- whole collection: run podman-compose up

## Development instructions

- Modify config file `~>` restart containers.

- Modify component packages `~>` rebuild corresponding image `~>` restart container.

- Create integration tests `~>` run with ???

