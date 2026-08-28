FROM ubuntu:resolute

WORKDIR /workspace

COPY --from=certs ./desktop.local.crt /usr/local/share/ca-certificates/
ENV NODE_EXTRA_CA_CERTS=/usr/local/share/ca-certificates/desktop.local.crt

RUN apt-get update && \
  apt-get install -y --no-install-recommends bash build-essential ca-certificates curl git sudo && \
  rm -rf /var/lib/apt/lists/*

# To get around `fatal: detected dubious ownership in repository`
RUN git config --global --add safe.directory '*'

RUN git clone https://github.com/obra/superpowers.git /opt/superpowers
RUN git clone https://github.com/dracula/pi-coding-agent.git /opt/pi-coding-agent

RUN mkdir -p /root/.pi/agent/themes/ /root/.pi/agent/skills/
RUN cp /opt/pi-coding-agent/dracula.json /root/.pi/agent/themes/dracula.json
RUN cp -r /opt/superpowers/skills/ /root/.pi/agent/skills/superpowers/

RUN update-ca-certificates

SHELL ["/bin/bash", "-o", "pipefail", "-c"]
ENV MISE_DATA_DIR="/mise"
ENV MISE_CONFIG_DIR="/mise"
ENV MISE_CACHE_DIR="/mise/cache"
ENV MISE_INSTALL_PATH="/usr/local/bin/mise"
ENV PATH="/mise/shims:$PATH"
RUN curl https://mise.run | sh

COPY mise.toml pyproject.toml .
RUN mise install
RUN mise task run pi:install
RUN mise task run python:install

COPY ./settings.json /root/.pi/agent/settings.json
COPY --from=pi ./agent/models.json /root/.pi/agent/models.json
COPY --from=pi ./agent/prompts/ /root/.pi/agent/prompts/

ENTRYPOINT ["pi"]
