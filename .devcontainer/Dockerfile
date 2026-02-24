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



# Install cloudflared
RUN wget -q https://github.com/cloudflare/cloudflared/releases/latest/download/cloudflared-linux-amd64 -O /usr/local/bin/cloudflared && \
    chmod +x /usr/local/bin/cloudflared && \
    rm -rf /var/lib/apt/lists/*

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

# Install Node.js (needed for npm before devcontainer features apply)
RUN curl -fsSL https://deb.nodesource.com/setup_24.x | bash - && \
    apt-get install -y nodejs && \
    rm -rf /var/lib/apt/lists/*

# Install AI tools globally
RUN npm install -g @anthropic-ai/claude-code && \
    npm install -g @augmentcode/auggie && \
    npm install -g @google/gemini-cli && \
    npm install -g opencode-ai && \
    npm install -g @kilocode/cli && \
    npm install -g ngrok

# Install Python AI tools
RUN pip install vicoa
RUN python -m pip install aider-install && aider-install

# Install Kimi Code
RUN curl -L code.kimi.com/install.sh | bash

# Install Kiro CLI
RUN curl -fsSL https://desktop-release.q.us-east-1.amazonaws.com/latest/kiro-cli-linux.tar.gz -o /tmp/kiro.tar.gz && \
    tar -xzf /tmp/kiro.tar.gz -C /usr/local/bin && \
    chmod +x /usr/local/bin/kiro-cli /usr/local/bin/kiro-cli-chat /usr/local/bin/kiro-cli-term && \
    rm -f /tmp/kiro.tar.gz



# Switch to non-root user
USER ${USERNAME}

# Set working directory
WORKDIR /workspaces/devcontainer

# Default command
CMD ["/bin/bash"]

