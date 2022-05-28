FROM node:16-bullseye-slim
WORKDIR /app

COPY docker-entrypoint.sh /usr/local/bin
# git update-index --chmod=+x ./docker-entrypoint.sh
# this is a lamer way
# RUN chmod +x /usr/local/bin/docker-entrypoint.sh

ENTRYPOINT ["docker-entrypoint.sh"]