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

## Jenkins DevOps Instruqt Image
### Environment configuration

- Name: `jenkins` or custom choice
- Image: `quay.io/acme_corp/instruqt-jenkins-devops`
- Entrypoint: (empty)
- Cmd: (empty)
- Ports: 8080
- Shell (empty)
- Environment Variables:
  - `CONTROLLER_PASSWORD`: Controller password for Jenkins. Default `learn_ansible`
  - `JENKINS_ADMIN_PASSWORD`: Jenkins admin password. Default `learn_ansible`
  - `REPO_TOKEN`: Access token to pull repo code into Jenkins
  - `CONTROLLER_URL`: Controller URL. Default `https://controller`
  - `GITEA_SERVER_URL`: Gitea server URL. Default `http://gitea:3000`
  - `REPO_PASSWORD`: Gitea repo password. Default `learn_ansible`

- Memory: `2048`