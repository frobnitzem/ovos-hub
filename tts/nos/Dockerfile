FROM jarbasai/ovos-base-audio:latest
USER root

RUN uv pip install ovos-tts-server

HEALTHCHECK --interval=60s --timeout=10s --retries=3 --start-period=60s \
    CMD curl http://127.0.0.1:9666/status || kill 1

RUN uv pip install ovos-tts-plugin-nos \
    && mkdir -p /home/${USER}/.local/share/nos_tts_models \
    && chown ${USER}:${USER} -R /home/${USER}

USER $USER

ENTRYPOINT ovos-tts-server --engine ovos-tts-plugin-nos

EXPOSE 9666
