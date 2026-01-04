FROM jarbasai/ovos-base:latest
USER root

RUN uv pip install git+https://github.com/OpenVoiceOS/ovos-translate-server

RUN uv pip install git+https://github.com/OpenVoiceOS/ovos-lang-detector-fasttext-plugin git+https://github.com/OpenVoiceOS/ovos-translate-plugin-nllb

HEALTHCHECK --interval=60s --timeout=10s --retries=3 --start-period=60s \
    CMD curl http://127.0.0.1:9686/status || kill 1

USER "$USER"

ENTRYPOINT ovos-translate-server --tx-engine ovos-translate-plugin-nllb --detect-engine ovos-lang-detector-fasttext-plugin

EXPOSE 9686
