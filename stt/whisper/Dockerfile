FROM jarbasai/ovos-base:latest
USER root

RUN uv pip install aiohttp SpeechRecognition ovos-stt-http-server

RUN uv pip install git+https://github.com/TigreGotico/ovos-stt-plugin-whisper.git

#COPY gpu.conf /etc/mycroft/mycroft.conf

HEALTHCHECK --interval=60s --timeout=10s --retries=3 --start-period=60s \
    CMD curl http://127.0.0.1:8080/status || kill 1

USER "$USER"

ENTRYPOINT ovos-stt-server --engine ovos-stt-plugin-whisper

EXPOSE 8080
