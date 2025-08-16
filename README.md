# Simple Dockerized Minecraft Forge Server

A Dockerized Minecraft Forge server setup for easy deployment and management.

## Quick Start

To run the server, simply use Docker Compose:

```bash
docker-compose up
```

The server will start automatically and be accessible on the default Minecraft port (25565).

## Installing Mods

1. Unzip your mod `.jar` files into the `config/mods` directory
2. Restart the server by pressing `Ctrl + C` and running `docker-compose up` again.

## Server Console Access

To access the server console and send commands, use mcrcon:

```bash
docker-compose exec minecraft mcrcon -p your_secure_password_here
```

Replace `your_secure_password_here` with your actual RCON password configured in `server.properties`.

## Configuration

- Server configuration files are located in the `config/` directory
- Main server properties can be found in `config/server.properties`
- Mod-specific configurations are in `config/config/`

## Stopping the Server

To stop the server just press `Ctrl + C` in the terminal `docker-compose up` was used in.

## Logs

To view server logs:

```bash
docker-compose logs minecraft
```

To follow logs in real-time:

```bash
docker-compose logs -f minecraft
```