FROM catthehacker/ubuntu:act-latest
LABEL org.opencontainers.image.source=https://github.com/snooptheone/act-ubuntu-custom
# Add what the GitHub runner has and the act image lacks.
RUN apt-get update -qq && apt-get install -y -qq --no-install-recommends gh default-jdk-headless rsync && apt-get clean && rm -rf /var/lib/apt/lists/*
