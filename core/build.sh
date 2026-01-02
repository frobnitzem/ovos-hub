
podman build -f core/Dockerfile -t jarbasai/ovos-core:latest ./core
podman build -f messagebus/Dockerfile -t jarbasai/ovos-messagebus ./messagebus
podman build -t jarbasai/ovos-messagebus-rust ./messagebus-rust
podman build -f gui-websocket/Dockerfile -t jarbasai/ovos-gui-websocket ./gui-websocket
podman build -f audio/Dockerfile -t jarbasai/ovos-audio ./audio
podman build -f phal/Dockerfile -t jarbasai/ovos-phal ./phal
podman build -t jarbasai/ovos-simple-listener ./simple-listener
podman build -t jarbasai/ovos-dinkum-listener ./dinkum-listener
podman build -t jarbasai/ovos-classic-listener ./classic-listener
