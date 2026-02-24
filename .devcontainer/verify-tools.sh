#!/bin/bash

echo ""
echo "=========================================="
echo "Verifying Installed Tools"
echo "=========================================="
echo ""

echo "Languages:"
echo "----------"
echo -n "Java: "
java -version 2>&1 | head -1

echo -n "Node.js: "
node --version

echo -n "Python: "
python --version

echo ""
echo "AI Tools:"
echo "----------"

if command -v claude &> /dev/null; then
    echo -n "Claude Code: "
    claude --version 2>&1 | head -1 || echo "installed"
else
    echo "Claude Code: not found"
fi

if command -v auggie &> /dev/null; then
    echo -n "Auggie CLI: "
    auggie --version 2>&1 | head -1 || echo "installed"
else
    echo "Auggie CLI: not found"
fi

if command -v opencode &> /dev/null; then
    echo -n "OpenCode: "
    opencode --version 2>&1 | head -1 || echo "installed"
else
    echo "OpenCode: not found"
fi

if command -v gemini &> /dev/null; then
    echo -n "Gemini CLI: "
    gemini --version 2>&1 | head -1 || echo "installed"
else
    echo "Gemini CLI: not found"
fi

if command -v kilo &> /dev/null; then
    echo -n "Kilo CLI: "
    kilo --version 2>&1 | head -1 || echo "installed"
else
    echo "Kilo CLI: not found"
fi

if command -v vicoa &> /dev/null; then
    echo -n "Vicoa: "
    vicoa --version 2>&1 | head -1 || echo "installed"
else
    echo "Vicoa: not found"
fi

if command -v kimi &> /dev/null; then
    echo -n "Kimi Code: "
    kimi --version 2>&1 | head -1 || echo "installed"
else
    echo "Kimi Code: not found"
fi

echo ""
echo "Tunneling Tools:"
echo "----------"

if command -v ngrok &> /dev/null; then
    echo -n "ngrok: "
    ngrok version 2>&1 || echo "installed"
else
    echo "ngrok: not found"
fi

if command -v cloudflared &> /dev/null; then
    echo -n "cloudflared: "
    cloudflared --version 2>&1 | head -1 || echo "installed"
else
    echo "cloudflared: not found"
fi

echo ""
echo "=========================================="
echo "Verification Complete!"
echo "=========================================="
echo ""
