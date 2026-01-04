FROM rocm/pytorch:latest

ARG CHANNEL=alpha
ARG USER=ovos
ARG USER_UID=1000
ARG USER_GID=1000

ENV USER="$USER"
ENV OVOS_CHANNEL="$CHANNEL"
ENV IS_OVOS_CONTAINER=true
ENV DEBIAN_FRONTEND=noninteractive
ENV PYTHONUNBUFFERED=1
ENV PYTHONDONTWRITEBYTECODE=1
ENV PIP_NO_CACHE_DIR=1
ENV PIP_DISABLE_PIP_VERSION_CHECK=1
# allow pip and uv to use system python
ENV PIP_BREAK_SYSTEM_PACKAGES=1
ENV UV_BREAK_SYSTEM_PACKAGES=1
ENV UV_SYSTEM_PYTHON=1
# use OVOS alpha channel
ENV PIP_PRE=1
ENV UV_PRERELEASE=allow
ENV UV_CONSTRAINT=https://raw.githubusercontent.com/OpenVoiceOS/ovos-releases/refs/heads/main/constraints-${OVOS_CHANNEL}.txt

SHELL ["/bin/bash", "-c"]

# Install packages first (changes more frequently than user creation)
RUN apt-get update \
  && apt-get install -y --no-install-recommends --no-install-suggests \
  ca-certificates \
  git \
  curl \
  python3-pip \
  python3-venv \
  && c_rehash \
  && apt-get --purge autoremove -y \
  && apt-get clean \
  && rm -rf /var/lib/apt/lists/* /var/cache/apt/archives/* /var/log/{apt,dpkg.log} /tmp/* /var/tmp/*

# Create user with specific UID/GID for better security and consistency
RUN groupmod -n "$USER" ubuntu \
 && usermod -l "$USER" -d "/home/$USER" -m ubuntu \
 && usermod -g "$USER" "$USER" \
 && chown -R "$USER:$USER" "/home/$USER"

# Setup Python environment
RUN pip install --upgrade setuptools wheel uv

# health check script
ENV OVOS_NAMESPACE=mycroft
COPY files/ovos-hc.py "/home/${USER}/ovos-hc"
RUN chmod +x "/home/${USER}/ovos-hc" && chown "${USER}:${USER}" "/home/${USER}/ovos-hc"
HEALTHCHECK --interval=60s --timeout=10s --retries=3 --start-period=60s \
  CMD python3 "/home/${USER}/ovos-hc" || exit 1

# ensure permissions of home dir
RUN chown "${USER}:${USER}" -R "/home/${USER}"

USER "$USER"

WORKDIR "/home/${USER}"
