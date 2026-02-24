# AI-Augmented Development Container

A comprehensive development container template that provides a multi-language development environment with integrated AI coding assistant tools.

## Overview

This project sets up a containerized development workspace with support for:
- **Languages**: Java, JavaScript/Node.js, Python
- **AI Tools**: 13+ AI coding assistants pre-installed
- **Container Runtime**: Docker & Docker Compose
- **IDE Integration**: VS Code Dev Containers

Perfect for developers who want a consistent, reproducible development environment with AI coding assistants pre-configured and ready to use.

## What's Included

### Languages & Runtimes
- **Java 25** with Maven and Gradle build tools
- **Node.js 24** for JavaScript/TypeScript development
- **Python 3.14** for Python development

### AI Coding Assistants

| Tool | Command | Package | Description |
|------|---------|---------|-------------|
| Claude Code | `claude` | `@anthropic-ai/claude-code` | Anthropic's AI assistant |
| Auggie | `auggie` | `@augmentcode/auggie` | Augment Code's AI assistant |
| Gemini CLI | `gemini` | `@google/gemini-cli` | Google's Gemini AI tool |
| OpenCode | `opencode` | `opencode-ai` | OpenCode AI coding tool |
| Kilo CLI | `kilo` | `@kilocode/cli` | Kilo AI assistant |
| Codex CLI | `codex` | `@openai/codex` | OpenAI's Codex CLI |
| Cline | `cline` | `cline` | AI coding assistant |
| Crush | `crush` | `@charmland/crush` | Charmland's AI tool |
| Qwen Code | `qwen` | `@qwen-code/qwen-code` | Alibaba's Qwen AI |
| Vicoa | `vicoa` | `pip install vicoa` | Python AI assistant |
| Aider | `aider` | `pip install aider-install` | AI pair programming |
| Kimi Code | `kimi` | `curl -L code.kimi.com/install.sh` | Kimi AI assistant |
| Kiro CLI | `kiro-cli` | Manual install | AWS Q CLI (Kiro) |
| Plandex | `plandex` | `curl -sL https://plandex.ai/install.sh` | AI task manager |

### Tunneling Tools
- **ngrok** - Secure tunneling (via npm)
- **cloudflared** - Cloudflare tunneling

### VS Code Extensions
- Java Extension Pack
- Maven for Java
- Gradle for Java
- ESLint
- Prettier
- Python
- Pylance

### Tools & Utilities
- Git
- curl, wget
- Build tools (build-essential)
- Zip/unzip utilities

## Quick Start

### Prerequisites
- Docker & Docker Compose installed
- VS Code with "Dev Containers" extension

### Opening in VS Code

1. Clone this repository:
```bash
git clone <repository-url>
cd devcontainer
```

2. Open in VS Code:
```bash
code .
```

3. When prompted, select "Reopen in Container" or press `Ctrl+Shift+P` and run "Dev Containers: Reopen in Container"

4. Wait for the container to build and start (this may take a few minutes on first run)

### Port Forwarding

The following ports are automatically forwarded from container to host:
- **8080** - Java/Spring Boot applications
- **3000** - Node.js/React development servers

## Installation & Setup

### Automatic Setup

Install or update all tools:
```bash
.devcontainer/install-tools.sh
```

### Verify Installation

Run verification:
```bash
.devcontainer/install-tools.sh
```

Or check individually:
```bash
# Check all AI tools
claude --version
auggie --version
gemini --version
opencode --version
kilo --version
codex --version
cline --version
crush --version
qwen --version
vicoa --version
aider --version
kimi --version
kiro-cli --version
plandex --version

# Check tunneling
ngrok --version
cloudflared --version
```

## Development Workflow

### Using AI Tools

```bash
# Claude Code
claude

# Auggie
auggie

# Gemini CLI
gemini

# OpenCode
opencode

# Kilo CLI
kilo

# Codex CLI
codex

# Cline
cline

# Crush
crush

# Qwen Code
qwen

# Aider
aider

# Kimi Code
kimi

# Kiro CLI
kiro-cli

# Plandex
plandex
```

### Using Node.js
```bash
npm install
npm start
```

### Using Python
```bash
pip install -r requirements.txt
python app.py
```

### Using Java
```bash
mvn clean package
mvn spring-boot:run
```

### Tunneling

```bash
# ngrok
ngrok http 8080

# cloudflared
cloudflared tunnel --url http://localhost:8080
```

## Customization

### Adding AI Tools

Edit `.devcontainer/Dockerfile`:
```dockerfile
RUN npm install -g @new-package/cli
```

### Adding VS Code Extensions

Edit `.devcontainer/devcontainer.json`:
```json
"extensions": [
  "ms-vscode.extension-id"
]
```

### Modifying Runtime Versions

Edit `.devcontainer/devcontainer.json`:
```json
"features": {
  "ghcr.io/devcontainers/features/java:1": { "version": "25" },
  "ghcr.io/devcontainers/features/node:1": { "version": "24" },
  "ghcr.io/devcontainers/features/python:1": { "version": "3.14" }
}
```

## Container Management

### Rebuild the Container

```bash
# From VS Code Command Palette
Ctrl+Shift+P -> "Dev Containers: Rebuild Container"

# Or from command line
docker-compose down
docker-compose up -d --build
```

### View Logs

```bash
docker-compose logs -f
```

### Stop the Container

```bash
docker-compose down
```

## Project Structure

```
.
├── .devcontainer/
│   ├── Dockerfile              # Container image definition
│   ├── devcontainer.json       # VS Code dev container config
│   ├── docker-compose.yml      # Docker Compose setup
│   └── install-tools.sh       # AI tools installer/updater
└── README.md                   # This file
```

## Troubleshooting

### Container fails to start
1. Check Docker is running: `docker ps`
2. View logs: `docker-compose logs`
3. Rebuild: `docker-compose down && docker-compose up -d --build`

### AI tools not found
1. Run install script: `.devcontainer/install-tools.sh`
2. Check npm global path: `npm list -g`
3. Verify PATH includes nvm: `echo $PATH`

### Port conflicts
Modify `devcontainer.json` forwardPorts or use custom mapping in docker-compose.

### VS Code extensions not loading
1. Rebuild the container
2. Clear VS Code cache: `Ctrl+Shift+P` -> "Developer: Reload Window"

## Performance Tips

- Use `.dockerignore` to exclude large directories
- Keep the container image lean by removing unused tools
- Use volume mounts for development to avoid rebuilding
- Cache npm/pip packages between rebuilds

## License

This project is provided as-is for development purposes.

## Additional Resources

- [VS Code Dev Containers Documentation](https://code.visualstudio.com/docs/dev/containers)
- [Docker Documentation](https://docs.docker.com/)
- [Claude Code Documentation](https://github.com/anthropics/claude-code)
- [Dev Containers Specification](https://containers.dev/)
