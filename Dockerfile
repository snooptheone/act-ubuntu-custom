FROM catthehacker/ubuntu:act-latest
LABEL org.opencontainers.image.source=https://github.com/snooptheone/act-ubuntu-custom
# Add what the GitHub runner has and the act image lacks.
RUN apt-get update -qq && apt-get install -y -qq --no-install-recommends gh default-jdk-headless rsync && apt-get clean && rm -rf /var/lib/apt/lists/*
# tea (Gitea CLI): newest release, resolved at build time.
RUN v=$(curl -fsS https://gitea.com/api/v1/repos/gitea/tea/releases/latest | sed -n 's/.*"tag_name":"v\([^"]*\)".*/\1/p') \
 && test -n "$v" \
 && cd /tmp \
 && curl -fsSLO "https://dl.gitea.com/tea/$v/tea-$v-linux-amd64" \
 && curl -fsSLO "https://dl.gitea.com/tea/$v/tea-$v-linux-amd64.sha256" \
 && sha256sum -c "tea-$v-linux-amd64.sha256" \
 && install "tea-$v-linux-amd64" /usr/local/bin/tea \
 && rm "tea-$v-linux-amd64" "tea-$v-linux-amd64.sha256"
