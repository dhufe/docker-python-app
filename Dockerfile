ARG FROM_IMAGE=alpine:latest
FROM ${FROM_IMAGE}

# ENV variables
ENV GIT_REPOSITORY="" \
    APP_NAME="App" \
    GIT_BRANCH="main" \
    PYTHONUNBUFFERED=1

ARG USERNAME=appuser
# Install python3
RUN apk add --update --no-cache python3 py3-pip && ln -sf python3 /usr/bin/python
# Change user and working directory
WORKDIR /app

# Copy scripts
COPY scripts/* ./scripts/

CMD [ "python", "scripts/test.py" ]