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
    tmux \
    && rm -rf /var/lib/apt/lists/*



# Install cloudflared via apt
RUN mkdir -p --mode=0755 /usr/share/keyrings && \
    curl -fsSL https://pkg.cloudflare.com/cloudflare-main.gpg | tee /usr/share/keyrings/cloudflare-main.gpg >/dev/null && \
    echo 'deb [signed-by=/usr/share/keyrings/cloudflare-main.gpg] https://pkg.cloudflare.com/cloudflared any main' | tee /etc/apt/sources.list.d/cloudflared.list && \
    apt-get update && apt-get install -y cloudflared && \
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

# Install AI tools via script
COPY install-ai-tools.sh /tmp/
RUN chmod +x /tmp/install-ai-tools.sh && /tmp/install-ai-tools.sh



# Switch to non-root user
USER ${USERNAME}

# Set working directory
WORKDIR /workspaces/devcontainer

# Default command
CMD ["/bin/bash"]

