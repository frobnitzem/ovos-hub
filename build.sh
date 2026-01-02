# base images contain shared dependencies + create a OVOS user + healthcheck
podman build -t jarbasai/ovos-base:latest ./base
podman build -t jarbasai/ovos-base-audio:latest ./base-sound
podman build -t jarbasai/ovos-base-rocm:latest ./base-rocm

podman build -t jarbasai/ovos-core:latest ./core/core
podman build -t jarbasai/ovos-messagebus ./core/messagebus
podman build -t jarbasai/ovos-messagebus-rust ./core/messagebus-rust
podman build -t jarbasai/ovos-gui-websocket ./core/gui-websocket
podman build -t jarbasai/ovos-audio ./core/audio
podman build -t jarbasai/ovos-phal ./core/phal
podman build -t jarbasai/ovos-simple-listener ./core/simple-listener
podman build -t jarbasai/ovos-dinkum-listener ./core/dinkum-listener
podman build -t jarbasai/ovos-classic-listener ./core/classic-listener
exit

podman build -t jarbasai/ovos-yaml-editor:latest ./utils/ovos-yaml-editor
podman build -t jarbasai/ovos-skill-settings-editor:latest ./utils/ovos-skill-settings-editor

podman build -t jarbasai/ovos-skill-alerts:latest ./skills/skill-alerts
podman build -t jarbasai/ovos-skill-camera:latest ./skills/skill-camera
podman build -t jarbasai/ovos-skill-date-time:latest ./skills/skill-date-time
podman build -t jarbasai/ovos-skill-duckduckgo:latest ./skills/skill-duckduckgo
podman build -t jarbasai/ovos-skill-easter-eggs:latest ./skills/skill-easter-eggs
podman build -t jarbasai/ovos-skill-fallback-unknown:latest ./skills/skill-fallback-unknown
podman build -t jarbasai/ovos-skill-ggwave:latest ./skills/skill-ggwave
podman build -t jarbasai/ovos-skill-hello-world:latest ./skills/skill-hello-world
podman build -t jarbasai/ovos-skill-homescreen:latest ./skills/skill-homescreen
podman build -t jarbasai/ovos-skill-jokes:latest ./skills/skill-jokes
podman build -t jarbasai/ovos-skill-parrot:latest ./skills/skill-parrot
podman build -t jarbasai/ovos-skill-personal:latest ./skills/skill-personal
podman build -t jarbasai/ovos-skill-randomness:latest ./skills/skill-randomness
podman build -t jarbasai/ovos-skill-tunein:latest ./skills/skill-tunein
podman build -t jarbasai/ovos-skill-volume:latest ./skills/skill-volume
podman build -t jarbasai/ovos-skill-weather:latest ./skills/skill-weather
podman build -t jarbasai/ovos-skill-wikihow:latest ./skills/skill-wikihow
podman build -t jarbasai/ovos-skill-wikipedia:latest ./skills/skill-wikipedia
podman build -t jarbasai/ovos-skill-wolfie:latest ./skills/skill-wolfie
podman build -t jarbasai/ovos-skill-wordnet:latest ./skills/skill-wordnet

podman build -t jarbasai/hivemind-core:latest ./hivemind/core
podman build -t jarbasai/hivemind-player:latest ./hivemind/player
podman build -t jarbasai/hivemind-persona:latest ./hivemind/persona
podman build -t jarbasai/hivemind-chatroom:latest ./hivemind/chatroom
podman build -t jarbasai/hivemind-webchat:latest ./hivemind/webchat
podman build -t jarbasai/hivemind-matrix-bot:latest ./hivemind/matrix-bot

podman build -t jarbasai/ovos-translate-server-nllb-rocm:latest ./translate/nllb

podman build -t jarbasai/ovos-tts-server-google-tx:latest ./tts/google-tx
podman build -t jarbasai/ovos-tts-server-matxa:latest ./tts/matxa
podman build -t jarbasai/ovos-tts-server-mimic:latest ./tts/mimic
podman build -t jarbasai/ovos-tts-server-cotovia:latest ./tts/cotovia
podman build -t jarbasai/ovos-tts-server-nos:latest ./tts/nos
podman build -t jarbasai/ovos-tts-server-piper:latest ./tts/piper
podman build -t jarbasai/ovos-tts-server-sam:latest ./tts/sam

podman build -t jarbasai/ovos-stt-server-nemo-rocm:latest ./stt/nemo
podman build -t jarbasai/ovos-stt-server-hitz-rocm:latest ./stt/hitz
podman build -t jarbasai/ovos-stt-server-whisper-rocm:latest ./stt/whisper
podman build -t jarbasai/ovos-stt-server-mynorthai-rocm:latest ./stt/mynorthai
