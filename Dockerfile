FROM buildkite/puppeteer:10.0.0

ENV npm_config_prefix="$GITHUB_WORKSPACE/.node"
RUN mkdir -p "$npm_config_prefix" \
  && chmod -R 777 "$npm_config_prefix" \
  && umask 000 \
  && npm install -g puppeteer

COPY entrypoint.sh /entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]
