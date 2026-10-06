FROM catthehacker/ubuntu:act-latest
LABEL org.opencontainers.image.source=https://github.com/snooptheone/act-ubuntu-custom
# Add what the GitHub runner has and the act image lacks. One install line per tool.
RUN apt-get update -qq && apt-get install -y -qq gh && apt-get clean
