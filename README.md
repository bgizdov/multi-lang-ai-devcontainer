# AI-Augmented Development Container

A comprehensive development container template that provides a multi-language development environment with integrated AI coding assistant tools.

## Overview

This project sets up a containerized development workspace with support for:
- **Languages**: Java, JavaScript/Node.js, Python
- **AI Tools**: Claude Code, Auggie, OpenCode, Gemini CLI
- **Container Runtime**: Docker & Docker Compose
- **IDE Integration**: VS Code Dev Containers

Perfect for developers who want a consistent, reproducible development environment with AI coding assistants pre-configured and ready to use.

## What's Included

### Languages & Runtimes
- **Java 25** with Maven and Gradle build tools
- **Node.js 24** for JavaScript/TypeScript development
- **Python 3.14** for Python development

### AI Coding Assistants
- **Claude Code** - Anthropic's Claude Code CLI
- **Auggie** - Augment Code's AI assistant
- **OpenCode AI** - OpenCode's AI coding tool
- **Gemini CLI** - Google's Gemini AI tool

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
- Code formatters (Prettier, language-specific formatters)

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
- **5000** - Python Flask/Django applications

## Installation & Setup

### Automatic Setup

Run the interactive setup script to install AI tools:
```bash
./install-ai-tools.sh
```

Or use the non-interactive version for automated deployments:
```bash
./setup-ai-tools.sh
```

### Manual AI Tools Installation

Install individual tools as needed:

```bash
# Claude Code
npm install -g @anthropic-ai/claude-code

# Auggie
npm install -g @augmentcode/auggie

# OpenCode AI
npm install -g opencode-ai

# Gemini CLI
npm install -g @google/gemini-cli
```

## Verifying Installation

Check that all tools are correctly installed:

```bash
# Check Java
java -version
mvn -version
gradle -version

# Check Node.js
node --version
npm --version

# Check Python
python --version
pip --version

# Check AI tools
claude-code --version
auggie --version
opencode --version
gemini --version
```

## Development Workflow

### Using Claude Code
```bash
claude-code <command> [options]
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

## Customization

### Adding VS Code Extensions

Edit `.devcontainer/devcontainer.json` and add to the `extensions` array:
```json
"extensions": [
  "ms-vscode.extension-id"
]
```

### Adding System Packages

Edit `.devcontainer/Dockerfile` to install additional packages:
```dockerfile
RUN apt-get update && apt-get install -y \
    package-name
```

### Modifying Runtime Versions

Edit `.devcontainer/devcontainer.json` features section to change language versions:
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
│   ├── Dockerfile                 # Container image definition
│   ├── devcontainer.json          # VS Code dev container config
│   ├── docker-compose.yml         # Docker Compose setup
│   ├── README.md                  # Dev container documentation
│   ├── install-ai-tools.sh        # AI tools installer script
│   └── setup-ai-tools.sh          # Interactive setup script
└── README.md                      # This file
```

## Troubleshooting

### Container fails to start
1. Check Docker is running: `docker ps`
2. View logs: `docker-compose logs`
3. Rebuild: `docker-compose down && docker-compose up -d --build`

### AI tools not found
1. Verify installation: Run the setup scripts again
2. Check npm global path: `npm list -g`
3. Verify environment variables are set correctly

### Port conflicts
If ports 8080, 3000, or 5000 are in use, modify `docker-compose.yml`:
```yaml
ports:
  - "8081:8080"  # Maps 8081 on host to 8080 in container
```

### VS Code extensions not loading
1. Rebuild the container
2. Clear VS Code cache: `Ctrl+Shift+P` -> "Developer: Reload Window"

## Performance Tips

- Use `.dockerignore` to exclude large directories
- Keep the container image lean by removing unused tools
- Use volume mounts for development to avoid rebuilding
- Cache npm/pip packages between rebuilds

## Contributing

To improve this template:
1. Test changes in a local container
2. Update documentation
3. Commit with clear messages
4. Submit pull requests

## License

This project is provided as-is for development purposes.

## Additional Resources

- [VS Code Dev Containers Documentation](https://code.visualstudio.com/docs/dev/containers)
- [Docker Documentation](https://docs.docker.com/)
- [Claude Code Documentation](https://github.com/anthropics/claude-code)
- [Dev Containers Specification](https://containers.dev/)

## Support

For issues or questions:
1. Check the [troubleshooting](#troubleshooting) section
2. Review `.devcontainer/README.md` for container-specific details
3. Consult individual tool documentation
4. Open an issue in the repository
