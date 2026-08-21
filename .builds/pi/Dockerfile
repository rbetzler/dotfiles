FROM node:24-bookworm-slim

RUN apt-get update && \
  apt-get install -y --no-install-recommends bash ca-certificates git ripgrep fd-find && \
  rm -rf /var/lib/apt/lists/*

# To get around `fatal: detected dubious ownership in repository`
RUN git config --global --add safe.directory '*'

RUN git clone https://github.com/obra/superpowers.git /opt/superpowers
RUN git clone https://github.com/dracula/pi-coding-agent.git /opt/pi-coding-agent

RUN mkdir -p /root/.pi/agent/themes/ /root/.pi/agent/skills/
RUN cp /opt/pi-coding-agent/dracula.json /root/.pi/agent/themes/dracula.json
RUN cp -r /opt/superpowers/skills/ /root/.pi/agent/skills/superpowers/

RUN npm install -g --ignore-scripts @earendil-works/pi-coding-agent
RUN pi install npm:pi-intercom && \
  pi install npm:pi-markdown-preview && \
  pi install npm:pi-prompt-template-model && \
  pi install npm:pi-subagents

COPY ./settings.json /root/.pi/agent/settings.json
COPY --from=pi ./agent/models.json /root/.pi/agent/models.json
COPY --from=pi ./agent/prompts/ /root/.pi/agent/prompts/

WORKDIR /workspace
ENTRYPOINT ["pi"]
