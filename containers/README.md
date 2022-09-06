# Containers for Instruqt

Here we document how to reuse existing containers within the Instruqt environment.

## Gitea

Refer to the [Gitea Configuration Cheat Sheet](https://docs.gitea.io/en-us/config-cheat-sheet/) for full environment variable options.

### Environment configuration

```yaml
- name: gitea
  image: gitea/gitea:1.16.8
  ports:
  - 3000
  environment:
    GITEA__DEFAULT__RUN_MODE: dev
    GITEA__database__DB_TYPE: sqlite3
    GITEA__database__PATH: /data/gitea/gitea.db
    GITEA__picture__DISABLE_GRAVATAR: "true"
    GITEA__repository__DEFAULT_PRIVATE: "false"
    GITEA__repository__DEFAULT_PUSH_CREATE_PRIVATE: "false"
    GITEA__repository__ENABLE_PUSH_CREATE_ORG: "true"
    GITEA__repository__ENABLE_PUSH_CREATE_USER: "true"
    GITEA__repository__ONLY_ALLOW_PUSH_IF_GITEA_ENVIRONMENT_SET: "false"
    GITEA__security__INSTALL_LOCK: "true"
    GITEA__server__DOMAIN: http://gitea
    GITEA__server__OFFLINE_MODE: "true"
    GITEA__server__ROOT_URL: http://gitea:3000
    GITEA__server__SSH_DOMAIN: http://gitea
    GITEA__service__DISABLE_REGISTRATION: "true"
    GITEA__service__REQUIRE_SIGNIN_VIEW: "false"
    GITEA__webhook__ALLOWED_HOST_LIST: '*'
    USER_GID: "1000"
    USER_UID: "1000"
  memory: 1024
  ```

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

>**Note**<p>
>To create a student user automatically, use the following line in the gitea >lifecycle setup script:
>
>```bash
># create a student user account
>su - git -c '/usr/local/bin/gitea admin user create --admin --username student --password learn_ansible --email root@localhost'

## Jenkins DevOps Instruqt Image

The `instruqt-jenkins-devops` image is pre-configured for the `devops-controller` lab using the following:

- [Dockerfile](../containers/devops-controller-jenkins/Dockerfile)
- Jenkins CASC [configuration file](../containers/devops-controller-jenkins/src/usr/share/jenkins/ref/jenkins_casc.yml)
- Jenkins [Plugins list](../containers/devops-controller-jenkins/src/usr/share/jenkins/ref/plugins.txt)

### Instruqt environment configuration

```yaml
- name: jenkins
  image: quay.io/acme_corp/instruqt-jenkins-devops
  ports:
  - 8080
  environment:
    CONTROLLER_PASSWORD: learn_ansible
    CONTROLLER_URL: https://controller
    GITEA_SERVER_URL: http://gitea:3000
    JENKINS_ADMIN_PASSWORD: learn_ansible
    REPO_PASSWORD: learn_ansible
  memory: 2048
  ```

### Available environment variables

- Environment Variables:
  - `CONTROLLER_PASSWORD`: Controller password for Jenkins. Default `learn_ansible`
  - `JENKINS_ADMIN_PASSWORD`: Jenkins admin password. Default `learn_ansible`
  - `REPO_TOKEN`: Access token to pull repo code into Jenkins
  - `CONTROLLER_URL`: Controller URL. Default `https://controller`
  - `GITEA_SERVER_URL`: Gitea server URL. Default `http://gitea:3000`
  - `REPO_PASSWORD`: Gitea repo password. Default `learn_ansible`
