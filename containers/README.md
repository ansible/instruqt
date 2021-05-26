# Containers for Instruqt

Here we document how to reuse existing containers within the Instruqt environment.

## Gitea

### Environment configuration

- Name: `gitea` or custom choice
- Image: `gitea/gitea:1.14.2`
- Entrypoint: (empty)
- Cmd: (empty)
- Ports: (empty)
- Shell (empty)
- Environment Variables:
  - `GITEA__server__DOMAIN`: `gitea`
  - `GITEA__server__SSH_PORT`: `22`
  - `GITEA__server__SSH_DOMAIN`: `gitea`
  - `GITEA__security__INSTALL_LOCK`: `true`
  - `GITEA__server__SSH_LISTEN_PORT`: `2222`
- Memory: `512`

### Tab configuration

- Title: `gitea` or custom choice
- Type: `Service`
- Host: `gitea` or other name from the environment configuration
- Path: `/`
- Port: `3000`

### Usage during exercises

The container is deployed without a default configuration. So during first access the following three steps need to be done:

1. register a user
1. configure the SSH key for the user
1. create a first repository