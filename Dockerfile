FROM alpine:latest
LABEL authors="Daniel Hufschläger"
#ARG USERNAME=appuser

# ENV variables
ENV GIT_REPOSITORY="" \
    APP_NAME="App" \
    GIT_BRANCH="main" \
    PYTHONUNBUFFERED=1

# Install python3
RUN apk add --update --no-cache python3 py3-pip git&&\
    ln -sf python3 /usr/bin/python

# Change user and working directory
WORKDIR /data/app

# Copy scripts
COPY scripts/* ./scripts/
RUN chmod +x ./scripts/entrypoint.sh

ENTRYPOINT ["./scripts/entrypoint.sh"]