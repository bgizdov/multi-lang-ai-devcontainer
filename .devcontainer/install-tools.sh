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

install_or_update_npm_tool "Claude Code" "@anthropic-ai/claude-code"
echo ""
install_or_update_npm_tool "Auggie CLI" "@augmentcode/auggie"
echo ""
install_or_update_npm_tool "OpenCode" "opencode-ai"
echo ""
install_or_update_npm_tool "Gemini CLI" "@google/gemini-cli"
echo ""
install_or_update_npm_tool "Kilo CLI" "@kilocode/cli"

echo ""
echo "Installing/updating Python AI tools..."
pip install vicoa --upgrade 2>&1 | grep -v "WARNING" || pip install vicoa 2>&1 | grep -v "WARNING"
echo "✓ Vicoa done"

echo ""
echo "Installing/updating Kimi Code..."
curl -L code.kimi.com/install.sh | bash 2>&1 | grep -v "curl"
echo "✓ Kimi Code done"

echo ""
echo "Installing/updating Kiro Code..."
curl -fsSL https://cli.kiro.dev/install | bash 2>&1 | grep -v "curl"
echo "✓ Kiro Code done"

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
verify_tool "Kiro Code" "kiro"

echo ""
echo "Tunneling Tools:"

verify_tool "ngrok" "ngrok"
verify_tool "cloudflared" "cloudflared"

echo ""
echo "=========================================="
echo "Complete!"
echo "=========================================="
echo ""
