FROM jarbasai/ovos-base:latest
USER root

RUN uv pip install aiohttp SpeechRecognition ovos-stt-http-server

#COPY gpu.conf /etc/mycroft/mycroft.conf

ENTRYPOINT ovos-stt-server --engine ovos-stt-plugin-nemo

EXPOSE 8080
