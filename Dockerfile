# Stage 1: Base image
#####################
# Sourcery and gcsfuse won't run on arm so force the use of `amd64` for the base image.
FROM --platform=linux/amd64 mcr.microsoft.com/devcontainers/python:1-3.12-bullseye AS base

# Install uv for everyone not just the current user.
RUN curl -LsSf https://astral.sh/uv/install.sh | sh \
 && cp /root/.local/bin/uv /usr/local/bin/uv

# Install Google Cloud utilities so we can use GCS.
RUN export GCSFUSE_REPO=gcsfuse-`lsb_release -c -s` \
 && curl https://packages.cloud.google.com/apt/doc/apt-key.gpg | sudo tee /usr/share/keyrings/cloud.google.asc \
 && echo "deb [signed-by=/usr/share/keyrings/cloud.google.asc] https://packages.cloud.google.com/apt $GCSFUSE_REPO main" | sudo tee /etc/apt/sources.list.d/gcsfuse.list \
 && echo "deb [signed-by=/usr/share/keyrings/cloud.google.asc] https://packages.cloud.google.com/apt cloud-sdk main" | sudo tee -a /etc/apt/sources.list.d/google-cloud-sdk.list \
 && sudo apt-get update \
 && sudo apt-get install --assume-yes gcsfuse google-cloud-cli

# This is where the production app will be run from and where the virtual environment
# will be prebuilt for use in testing.
WORKDIR /app

# Add some labels so it looks nice in Github packages.
LABEL org.opencontainers.image.source=https://github.com/joejcollins/lieutenant-green/

# Stage 2a: Development and test image
######################################
# Includes a pre-build virtual environment with all the developer dependencies, but no
# source files, so is only rebuilt when the requirements.dev.txt or Dockerfile change.
# The prebuilt virtual environment is used to speed up testing so we don't have to wait
# for the dependencies to install before the tests can be run.
FROM base AS development

LABEL org.opencontainers.image.description="lieutenant-green development container."

# Stage 2b: Production image
############################
# Include a prebuilt virtual environment with only the production dependencies and all
# the source files.  This will be used to run the app in production.
FROM base AS production

LABEL org.opencontainers.image.description="lieutenant-green production container."

# Copy everything and build the virtual environment without the dev dependencies.
COPY . ./
RUN make venv-prod

# Run the app in the virtual environment.
CMD [".venv/bin/run"]
