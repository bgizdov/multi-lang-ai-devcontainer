#!/bin/bash
set -e

echo "Installing AI tools..."

# Install Python
apt-get update && apt-get install -y python3 python3-pip python3-venv && rm -rf /var/lib/apt/lists/*

# Install Node.js tools
npm install -g @anthropic-ai/claude-code
npm install -g @augmentcode/auggie
npm install -g @google/gemini-cli
npm install -g opencode-ai
npm install -g @kilocode/cli
npm install -g ngrok
npm install -g @openai/codex
npm install -g cline
npm install -g @charmland/crush
npm install -g @qwen-code/qwen-code
npm install -g happy-coder

# Install Python AI tools
pip3 install --break-system-packages vicoa
pip3 install --break-system-packages aider-install && aider-install

# Install Kimi Code
curl -L code.kimi.com/install.sh | bash

# Install Kiro CLI
curl -fsSL https://desktop-release.q.us-east-1.amazonaws.com/latest/kiro-cli-linux.tar.gz -o /tmp/kiro.tar.gz && \
    tar -xzf /tmp/kiro.tar.gz -C /usr/local/bin && \
    chmod +x /usr/local/bin/kiro-cli /usr/local/bin/kiro-cli-chat /usr/local/bin/kiro-cli-term && \
    rm -f /tmp/kiro.tar.gz

# Install Plandex
curl -sL https://plandex.ai/install.sh | bash

echo "AI tools installation complete!"
