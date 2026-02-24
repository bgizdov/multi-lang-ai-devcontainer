#!/bin/bash

echo ""
echo "=========================================="
echo "AI Tools Installer"
echo "=========================================="
echo ""

echo ""
echo "Installing AI CLI Tools..."
echo "=========================================="

install_npm_tool() {
    local name=$1
    local package=$2
    echo ""
    echo "Installing $name..."
    if sudo npm install -g $package 2>&1 | grep -v "npm WARN"; then
        echo "✓ $name installed"
    else
        echo "✗ Failed to install $name"
    fi
}

install_npm_tool "Claude Code" "@anthropic-ai/claude-code"
install_npm_tool "Auggie CLI" "@augmentcode/auggie"
install_npm_tool "OpenCode" "opencode-ai"
install_npm_tool "Gemini CLI" "@google/gemini-cli"
install_npm_tool "Kilo CLI" "@kilocode/cli"

echo ""
echo "Installing Python AI tools..."
if pip install vicoa 2>&1 | grep -v "WARNING"; then
    echo "✓ Vicoa installed"
else
    echo "✗ Failed to install Vicoa"
fi

echo ""
echo "Installing Kimi Code..."
if curl -L code.kimi.com/install.sh | bash 2>&1 | grep -v "curl"; then
    echo "✓ Kimi Code installed"
else
    echo "✗ Failed to install Kimi Code"
fi

echo ""
echo "Installing Kiro Code..."
if curl -fsSL https://cli.kiro.dev/install | bash 2>&1 | grep -v "curl"; then
    echo "✓ Kiro Code installed"
else
    echo "✗ Failed to install Kiro Code"
fi

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
echo "Installation Complete!"
echo "=========================================="
echo ""
