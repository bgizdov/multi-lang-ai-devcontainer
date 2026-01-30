# Base image from the Java devcontainer template
FROM mcr.microsoft.com/devcontainers/base:ubuntu

# Set environment variables
ENV DEBIAN_FRONTEND=noninteractive

# Install common dependencies
RUN apt-get update && apt-get install -y \
    curl \
    wget \
    git \
    build-essential \
    ca-certificates \
    gnupg \
    lsb-release \
    software-properties-common \
    zip \
    unzip \
    && rm -rf /var/lib/apt/lists/*

# Create a non-root user (vscode user is created by the base image)
ARG USERNAME=vscode
ARG USER_UID=1000
ARG USER_GID=$USER_UID

# The features defined in devcontainer.json will install:
# - Java (via ghcr.io/devcontainers/features/java:1)
# - Node.js 24 (via ghcr.io/devcontainers/features/node:1)
# - Python 3.14 (via ghcr.io/devcontainers/features/python:1)
# - Git (via ghcr.io/devcontainers/features/git:1)

# Set the default shell to bash
SHELL ["/bin/bash", "-c"]

# Create workspace directory
RUN mkdir -p /workspaces/devcontainer && chown -R ${USERNAME}:${USERNAME} /workspaces

# Switch to non-root user
USER ${USERNAME}

# Set working directory
WORKDIR /workspaces/devcontainer

# Default command
CMD ["/bin/bash"]

