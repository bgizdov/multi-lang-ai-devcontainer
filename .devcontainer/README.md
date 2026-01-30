# Dev Container Configuration

This directory contains the development container configuration for this project.

## What's Included

This devcontainer is based on the Java template and includes:

- **Java** - Latest version with Maven and Gradle
- **Node.js 24** - For JavaScript/TypeScript development
- **Python 3.14** - For Python development
- **Git** - Version control

## Features

The container includes the following VS Code extensions:
- Java Extension Pack
- Maven for Java
- Gradle for Java
- ESLint
- Prettier
- Python
- Pylance

## Ports

The following ports are forwarded by default:
- `8080` - Java/Spring Boot applications
- `3000` - Node.js/React applications
- `5000` - Python/Flask applications

## Usage

### Opening in VS Code

1. Install the "Dev Containers" extension in VS Code
2. Open this folder in VS Code
3. Click "Reopen in Container" when prompted (or use Command Palette: "Dev Containers: Reopen in Container")

### Building the Container

The container will be built automatically when you open it in VS Code. To rebuild:
- Command Palette → "Dev Containers: Rebuild Container"

### Verifying Installation

After the container is created, the `postCreateCommand` will run and display the versions of Java, Node.js, and Python.

You can also manually verify by running:
```bash
java -version
node --version
python --version
```

## Customization

- **devcontainer.json** - Main configuration file
- **Dockerfile** - Base image and system dependencies
- **docker-compose.yml** - Docker Compose service definition

To add more features, edit the `features` section in `devcontainer.json`.

