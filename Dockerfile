ARG FROM_IMAGE=alpine:latest
FROM ${FROM_IMAGE}

# ENV variables
ENV GIT_REPOSITORY="" \
    APP_NAME="App" \
    GIT_BRANCH="" \
    PYTHONUNBUFFERED=1


ARG USERNAME=appuser
# Install python3
RUN apk add --update --no-cache python3 py3-pip && ln -sf python3 /usr/bin/python
# Add a non-root user
#RUN adduser ${USERNAME}
# Install git if not installed
# RUN which git || ((apt-get -yq update && apt-get -yq install git && rm -rf /var/lib/apt/lists/*) || (apk update --no-cache && apk add --no-cache git))

# Change user and working directory
WORKDIR /app

# Copy scripts
COPY scripts/* ./scripts/
#RUN chmod +x ./scripts/entrypoint.sh

CMD [ "python", "scripts/test.py" ]