FROM jarbasai/ovos-base:latest

USER root

RUN uv pip install git+https://github.com/OpenVoiceOS/ovos-yaml-editor

HEALTHCHECK --interval=60s --timeout=10s --retries=3 --start-period=60s \
    CMD curl http://127.0.0.1:9200/status || kill 1

USER "$USER"

# Expose port
EXPOSE 9200

# Command to run the web UI
CMD ["ovos-yaml-editor", "--host=0.0.0.0", "--port=9200"]

