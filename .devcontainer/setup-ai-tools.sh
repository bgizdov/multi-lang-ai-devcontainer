#!/bin/bash

echo ""
echo "=========================================="
echo "AI Tools Setup"
echo "=========================================="
echo ""
echo "This script will install AI coding assistants:"
echo "  - Claude Code (Anthropic)"
echo "  - Auggie CLI (Augment Code)"
echo "  - OpenCode (Open Source)"
echo "  - Gemini CLI (Google)"
echo ""
read -p "Do you want to install AI tools now? (y/n) " -n 1 -r
echo ""

if [[ ! $REPLY =~ ^[Yy]$ ]]; then
    echo "Skipping AI tools installation."
    echo "You can run this script later: .devcontainer/setup-ai-tools.sh"
    exit 0
fi

echo ""
echo "Installing AI CLI Tools..."
echo "=========================================="

# Install Claude Code
echo ""
echo "[1/4] Installing Claude Code..."
if sudo npm install -g @anthropic-ai/claude-code 2>&1 | grep -v "npm WARN"; then
    echo "✓ Claude Code installed"
else
    echo "✗ Failed to install Claude Code"
fi

# Install Auggie CLI
echo ""
echo "[2/4] Installing Auggie CLI..."
if sudo npm install -g @augmentcode/auggie 2>&1 | grep -v "npm WARN"; then
    echo "✓ Auggie CLI installed"
else
    echo "✗ Failed to install Auggie CLI"
fi

# Install OpenCode
echo ""
echo "[3/5] Installing OpenCode..."
if sudo npm install -g opencode-ai 2>&1 | grep -v "npm WARN"; then
    echo "✓ OpenCode installed"
else
    echo "✗ Failed to install OpenCode"
fi

# Install Gemini CLI
echo ""
echo "[4/5] Installing Gemini CLI..."
if sudo npm install -g @google/gemini-cli 2>&1 | grep -v "npm WARN"; then
    echo "✓ Gemini CLI installed"
else
    echo "✗ Failed to install Gemini CLI"
fi

# Install Kilo CLI
echo ""
echo "[5/5] Installing Kilo CLI..."
if sudo npm install -g @kilocode/cli 2>&1 | grep -v "npm WARN"; then
    echo "✓ Kilo CLI installed"
else
    echo "✗ Failed to install Kilo CLI"
fi

# Verify installations
echo ""
echo "=========================================="
echo "Verification"
echo "=========================================="
echo ""

if command -v claude &> /dev/null; then
    echo "✓ Claude Code: $(which claude)"
else
    echo "✗ Claude Code: not found"
fi

if command -v auggie &> /dev/null; then
    echo "✓ Auggie CLI: $(which auggie)"
else
    echo "✗ Auggie CLI: not found"
fi

if command -v opencode &> /dev/null; then
    echo "✓ OpenCode: $(which opencode)"
else
    echo "✗ OpenCode: not found"
fi

if command -v gemini &> /dev/null; then
    echo "✓ Gemini CLI: $(which gemini)"
else
    echo "✗ Gemini CLI: not found"
fi

if command -v kilo &> /dev/null; then
    echo "✓ Kilo CLI: $(which kilo)"
else
    echo "✗ Kilo CLI: not found"
fi

echo ""
echo "=========================================="
echo "Setup Complete!"
echo "=========================================="
echo ""
echo "You can now use:"
echo "  - claude    (Anthropic's Claude Code)"
echo "  - auggie    (Augment Code CLI)"
echo "  - opencode  (OpenCode AI)"
echo "  - gemini    (Google's Gemini CLI)"
echo "  - kilo      (Kilo CLI)"
echo ""

# Mark as installed
touch ~/.ai-tools-installed

