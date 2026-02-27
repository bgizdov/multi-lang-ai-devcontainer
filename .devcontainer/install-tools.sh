#!/bin/bash
set -e

export PATH="$HOME/.local/bin:$PATH:/usr/local/bin"
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"

npm config set prefix /usr/local

echo ""
echo "=========================================="
echo "AI Tools Installer & Updater"
echo "=========================================="
echo ""

install_or_update_npm_tool() {
    local name=$1
    local package=$2
    echo "Installing/updating $name..."
    npm install -g $package
    echo "✓ $name done"
}

echo "Installing/updating npm tools..."
echo ""

echo "Installing/updating Claude Code..."
export PATH="$HOME/.local/bin:$PATH"
curl -fsSL https://claude.ai/install.sh | bash
echo "✓ Claude Code done"
echo ""
install_or_update_npm_tool "Auggie CLI" "@augmentcode/auggie"
echo ""
install_or_update_npm_tool "OpenCode" "opencode-ai"
echo ""
install_or_update_npm_tool "Gemini CLI" "@google/gemini-cli"
echo ""
install_or_update_npm_tool "Kilo CLI" "@kilocode/cli"
echo ""
install_or_update_npm_tool "ngrok" "ngrok"
echo ""
install_or_update_npm_tool "Codex CLI" "@openai/codex"
echo ""
install_or_update_npm_tool "Cline" "cline"
echo ""
install_or_update_npm_tool "Crush" "@charmland/crush"
echo ""
install_or_update_npm_tool "Qwen Code" "@qwen-code/qwen-code"
echo ""
install_or_update_npm_tool "Happy Coder" "happy-coder"

echo ""
echo "Installing/updating Python AI tools..."
export PATH="$HOME/.local/bin:$PATH"
pip3 install vicoa --upgrade --break-system-packages
echo "✓ Vicoa done"

echo ""
echo "Installing/updating Aider..."
export PATH="$HOME/.local/bin:$PATH"
curl -LsSf https://aider.chat/install.sh | sh
echo "✓ Aider done"

echo ""
echo "Installing/updating Kimi Code..."
export PATH="$HOME/.local/bin:$PATH"
curl -L code.kimi.com/install.sh | bash
echo "✓ Kimi Code done"

echo ""
echo "Installing/updating Kiro CLI..."
export PATH="$HOME/.local/bin:$PATH"
if [ ! -firo-cli ]; then ~/.local/bin/k
    curl -fsSL https://desktop-release.q.us-east-1.amazonaws.com/latest/kiro-cli-linux.tar.gz -o /tmp/kiro.tar.gz && \
    tar -xzf /tmp/kiro.tar.gz -C ~/.local/bin && \
    chmod +x ~/.local/bin/kiro-cli ~/.local/bin/kiro-cli-chat ~/.local/bin/kiro-cli-term && \
    rm -f /tmp/kiro.tar.gz
fi
echo "✓ Kiro CLI done"

echo ""
echo "Installing/updating Plandex..."
export PATH="$HOME/.local/bin:$PATH"
curl -sL https://plandex.ai/install.sh | bash
echo "✓ Plandex done"

echo ""
echo "=========================================="
echo "Complete!"
echo "=========================================="
echo ""

echo "AI Tools verification:"
verify_tool() {
    local name=$1
    local cmd=$2
    if command -v $cmd &> /dev/null; then
        echo "✓ $name"
    else
        echo "✗ $name"
    fi
}

verify_tool "Claude Code" "claude"
verify_tool "Auggie CLI" "auggie"
verify_tool "OpenCode" "opencode"
verify_tool "Gemini CLI" "gemini"
verify_tool "Kilo CLI" "kilo"
verify_tool "Vicoa" "vicoa"
verify_tool "Kimi Code" "kimi"
verify_tool "Kiro CLI" "kiro-cli"
verify_tool "Aider" "aider"
verify_tool "Codex CLI" "codex"
verify_tool "Plandex" "plandex"
verify_tool "Cline" "cline"
verify_tool "Crush" "crush"
verify_tool "Qwen Code" "qwen"
verify_tool "Happy Coder" "happy"
verify_tool "ngrok" "ngrok"
verify_tool "cloudflared" "cloudflared"
