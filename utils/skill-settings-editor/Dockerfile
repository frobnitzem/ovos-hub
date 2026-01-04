#FROM ghcr.io/oscillatelabsllc/ovos-skill-config-tool:latest
FROM jarbasai/ovos-base:latest
USER root

RUN uv pip install git+https://github.com/JarbasAl/ovos-skill-config-tool

HEALTHCHECK --interval=60s --timeout=10s --retries=3 --start-period=60s \
    CMD curl --header "Connection: Upgrade" --header "Upgrade: Websocket" http://127.0.0.1:8000/core || kill 1

USER "$USER"
