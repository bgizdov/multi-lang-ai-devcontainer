#!/bin/bash

echo "=========================================="
echo "Installing AI CLI Tools"
echo "=========================================="

# Install Claude Code
echo ""
echo "Installing Claude Code..."
sudo npm install -g @anthropic-ai/claude-code
if [ $? -eq 0 ]; then
    echo "✓ Claude Code installed successfully"
else
    echo "✗ Failed to install Claude Code"
fi

# Install Auggie CLI
echo ""
echo "Installing Auggie CLI..."
sudo npm install -g @augmentcode/auggie
if [ $? -eq 0 ]; then
    echo "✓ Auggie CLI installed successfully"
else
    echo "✗ Failed to install Auggie CLI"
fi

# Install OpenCode
echo ""
echo "Installing OpenCode..."
sudo npm install -g opencode-ai
if [ $? -eq 0 ]; then
    echo "✓ OpenCode installed successfully"
else
    echo "✗ Failed to install OpenCode"
fi

# Install Gemini CLI
echo ""
echo "Installing Gemini CLI..."
sudo npm install -g @google/gemini-cli
if [ $? -eq 0 ]; then
    echo "✓ Gemini CLI installed successfully"
else
    echo "✗ Failed to install Gemini CLI"
fi

# Verify installations
echo ""
echo "=========================================="
echo "Verifying Installations"
echo "=========================================="

echo ""
echo "Java:"
java -version

echo ""
echo "Node.js:"
node --version

echo ""
echo "Python:"
python --version

echo ""
echo "AI Tools:"
echo "----------"

if command -v claude &> /dev/null; then
    echo "✓ Claude Code: $(claude --version 2>&1 || echo 'installed')"
else
    echo "✗ Claude Code: not found"
fi

if command -v auggie &> /dev/null; then
    echo "✓ Auggie CLI: $(auggie --version 2>&1 || echo 'installed')"
else
    echo "✗ Auggie CLI: not found"
fi

if command -v opencode &> /dev/null; then
    echo "✓ OpenCode: $(opencode --version 2>&1 || echo 'installed')"
else
    echo "✗ OpenCode: not found"
fi

if command -v gemini &> /dev/null; then
    echo "✓ Gemini CLI: $(gemini --version 2>&1 || echo 'installed')"
else
    echo "✗ Gemini CLI: not found"
fi

echo ""
echo "=========================================="
echo "Installation Complete!"
echo "=========================================="

