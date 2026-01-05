FROM jarbasai/ovos-base-audio:latest
USER root

RUN uv pip install ovos-tts-server

HEALTHCHECK --interval=60s --timeout=10s --retries=3 --start-period=60s \
    CMD curl http://127.0.0.1:9666/status || kill 1
#RUN uv pip install phoonnx

USER $USER

# this package writes cache files to its own source directory [sic]
RUN git clone https://github.com/TigreGotico/phoonnx.git
USER root
RUN uv pip install -e phoonnx
USER $USER

ENTRYPOINT ovos-tts-server --engine ovos-tts-plugin-phoonnx

EXPOSE 9666
