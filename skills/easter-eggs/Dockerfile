FROM jarbasai/ovos-base:latest

USER root


ENV SKILL_ID="skill-easter-eggs.openvoiceos"

# used by healthcheck script
ENV OVOS_SERVICE_NAME="$SKILL_ID"

# TODO - this skill doesnt allow latest ovos package versions, need to handle dependencies manually
RUN uv pip install git+https://github.com/OpenVoiceOS/ovos-skill-easter-eggs --no-deps
RUN uv pip install python-dateutil ovos-number-parser ovos-mark1-utils

# force latest ovos-workshop version
RUN uv pip install -U ovos-workshop

USER "$USER"

ENTRYPOINT ovos-skill-launcher $SKILL_ID
