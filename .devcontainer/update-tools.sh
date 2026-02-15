#!/bin/bash

echo ""
echo "=========================================="
echo "Update All Tools"
echo "=========================================="
echo ""

update_npm_tools() {
    echo "Updating npm tools..."
    echo ""

    echo "[1/4] Updating Claude Code..."
    npm update -g @anthropic-ai/claude-code 2>&1 | grep -v "npm WARN" || npm install -g @anthropic-ai/claude-code 2>&1 | grep -v "npm WARN"
    echo "✓ Claude Code updated"

    echo ""
    echo "[2/4] Updating Auggie CLI..."
    npm update -g @augmentcode/auggie 2>&1 | grep -v "npm WARN" || npm install -g @augmentcode/auggie 2>&1 | grep -v "npm WARN"
    echo "✓ Auggie CLI updated"

    echo ""
    echo "[3/4] Updating OpenCode..."
    npm update -g opencode-ai 2>&1 | grep -v "npm WARN" || npm install -g opencode-ai 2>&1 | grep -v "npm WARN"
    echo "✓ OpenCode updated"

    echo ""
    echo "[4/4] Updating Gemini CLI..."
    npm update -g @google/gemini-cli 2>&1 | grep -v "npm WARN" || npm install -g @google/gemini-cli 2>&1 | grep -v "npm WARN"
    echo "✓ Gemini CLI updated"
}

update_ngrok() {
    echo "Updating ngrok..."
    if command -v ngrok &> /dev/null; then
        ngrok update 2>&1 || (sudo apt-get update && sudo apt-get install -y ngrok)
        echo "✓ ngrok updated"
    else
        echo "Installing ngrok..."
        curl -fsSL https://ngrok-agent.s3.amazonaws.com/ngrok.asc | gpg --dearmor -o /usr/share/keyrings/ngrok.gpg
        echo "deb [signed-by=/usr/share/keyrings/ngrok.gpg] https://ngrok-agent.s3.amazonaws.com/apt stable main" | sudo tee /etc/apt/sources.list.d/ngrok.list
        sudo apt-get update && sudo apt-get install -y ngrok
        echo "✓ ngrok installed"
    fi
}

update_cloudflared() {
    echo "Updating cloudflared..."
    if command -v cloudflared &> /dev/null; then
        cloudflared update 2>&1 || {
            wget -q https://github.com/cloudflare/cloudflared/releases/latest/download/cloudflared-linux-amd64 -O /tmp/cloudflared
            sudo mv /tmp/cloudflared /usr/local/bin/cloudflared
            sudo chmod +x /usr/local/bin/cloudflared
        }
        echo "✓ cloudflared updated"
    else
        echo "Installing cloudflared..."
        wget -q https://github.com/cloudflare/cloudflared/releases/latest/download/cloudflared-linux-amd64 -O /usr/local/bin/cloudflared
        chmod +x /usr/local/bin/cloudflared
        echo "✓ cloudflared installed"
    fi
}

update_npm_tools
echo ""

update_ngrok
echo ""

update_cloudflared
echo ""

echo "=========================================="
echo "Verification"
echo "=========================================="
echo ""

if command -v claude &> /dev/null; then
    echo "✓ Claude Code: $(claude --version 2>/dev/null || echo "installed")"
else
    echo "✗ Claude Code: not found"
fi

if command -v auggie &> /dev/null; then
    echo "✓ Auggie CLI: $(auggie --version 2>/dev/null || echo "installed")"
else
    echo "✗ Auggie CLI: not found"
fi

if command -v opencode &> /dev/null; then
    echo "✓ OpenCode: $(opencode --version 2>/dev/null || echo "installed")"
else
    echo "✗ OpenCode: not found"
fi

if command -v gemini &> /dev/null; then
    echo "✓ Gemini CLI: $(gemini --version 2>/dev/null || echo "installed")"
else
    echo "✗ Gemini CLI: not found"
fi

if command -v ngrok &> /dev/null; then
    echo "✓ ngrok: $(ngrok version 2>/dev/null || echo "installed")"
else
    echo "✗ ngrok: not found"
fi

if command -v cloudflared &> /dev/null; then
    echo "✓ cloudflared: $(cloudflared --version 2>/dev/null || echo "installed")"
else
    echo "✗ cloudflared: not found"
fi

echo ""
echo "=========================================="
echo "Update Complete!"
echo "=========================================="
echo ""
