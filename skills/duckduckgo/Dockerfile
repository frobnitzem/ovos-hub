FROM jarbasai/ovos-base:latest

USER root

ENV SKILL_ID="ovos-skill-ddg.openvoiceos"

# used by healthcheck script
ENV OVOS_SERVICE_NAME="$SKILL_ID"

RUN uv pip install ovos-skill-ddg

# force latest ovos-workshop version
RUN uv pip install -U ovos-workshop

USER "$USER"

ENTRYPOINT ovos-skill-launcher $SKILL_ID
