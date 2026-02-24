#!/bin/bash

echo ""
echo "=========================================="
echo "AI Tools Installer & Updater"
echo "=========================================="
echo ""

install_or_update_npm_tool() {
    local name=$1
    local package=$2
    echo "Installing/updating $name..."
    npm update -g $package 2>&1 | grep -v "npm WARN" || npm install -g $package 2>&1 | grep -v "npm WARN"
    echo "✓ $name done"
}

echo "Installing/updating npm tools..."
echo ""

echo "Installing/updating Claude Code..."
curl -fsSL https://claude.ai/install.sh | bash 2>&1 | grep -v "curl"
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
pip install vicoa --upgrade 2>&1 | grep -v "WARNING" || pip install vicoa 2>&1 | grep -v "WARNING"
echo "✓ Vicoa done"

echo ""
echo "Installing/updating Aider..."
python -m pip install aider-install 2>&1 | grep -v "WARNING" && aider-install 2>&1 | grep -v "WARNING"
echo "✓ Aider done"

echo ""
echo "Installing/updating Kimi Code..."
curl -L code.kimi.com/install.sh | bash 2>&1 | grep -v "curl"
echo "✓ Kimi Code done"

echo ""
echo "Installing/updating Kiro CLI..."
if [ ! -f ~/.local/bin/kiro-cli ]; then
    curl -fsSL https://desktop-release.q.us-east-1.amazonaws.com/latest/kiro-cli-linux.tar.gz -o /tmp/kiro.tar.gz && \
    tar -xzf /tmp/kiro.tar.gz -C ~/.local/bin && \
    chmod +x ~/.local/bin/kiro-cli ~/.local/bin/kiro-cli-chat ~/.local/bin/kiro-cli-term && \
    rm -f /tmp/kiro.tar.gz
fi
echo "✓ Kiro CLI done"

echo ""
echo "Installing/updating Plandex..."
curl -sL https://plandex.ai/install.sh | bash 2>&1 | grep -v "curl"
echo "✓ Plandex done"

echo ""
echo "=========================================="
echo "Verification"
echo "=========================================="
echo ""

echo "Languages:"
echo -n "Java: "
java -version 2>&1 | head -1
echo -n "Node.js: "
node --version
echo -n "Python: "
python --version

echo ""
echo "AI Tools:"

verify_tool() {
    local name=$1
    local cmd=$2
    if command -v $cmd &> /dev/null; then
        echo "✓ $name: installed"
    else
        echo "✗ $name: not found"
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

echo ""
echo "Tunneling Tools:"

verify_tool "ngrok" "ngrok"
verify_tool "cloudflared" "cloudflared"

echo ""
echo "=========================================="
echo "Complete!"
echo "=========================================="
echo ""
