FROM node:24-bookworm-slim

COPY --from=pi ./agent/models.json /root/.pi/agent/models.json
COPY --from=pi ./agent/prompts/ /root/.pi/agent/prompts/
COPY --from=superpowers ./skills/ /root/.agents/skills/superpowers/

RUN apt-get update && \
  apt-get install -y --no-install-recommends bash ca-certificates git ripgrep fd-find && \
  rm -rf /var/lib/apt/lists/*
RUN npm install -g --ignore-scripts @earendil-works/pi-coding-agent

RUN pi install npm:pi-subagents
# RUN pi install npm:pi-web-access

WORKDIR /workspace
ENTRYPOINT ["pi"]
