# Containers for Instruqt

Here we document how to reuse existing containers within the Instruqt environment.

## Gitea

The custom [`instruqt_gitea`](https://quay.io/repository/acme_corp/instruqt_gitea) image auto-generates several Gitea configuration variables to match the custom Instruqt lab environment. The image also provides a configurable student and admin user.

More information on the Instruqt tab URL format can can be found [here](https://docs.instruqt.com/reference/instruqt-platform/networking#authenticated-web-traffic-from-learners).

### Environment variables

#### Instruqt environment

The image creates the following Gitea environment variables when used in Instruqt. You can override the default values using environment variables in the host sandbox configuration.

```bash
GITEA__server__PROTOCOL="https"
GITEA__server__HTTP_PORT="8443"
GITEA__server__DOMAIN="${HOSTNAME}"-"${GITEA__server__HTTP_PORT}"-"${INSTRUQT_PARTICIPANT_ID}"."${INSTRUQT_PARTICIPANTS_DNS}"
GITEA__server__ROOT_URL="${GITEA__server__PROTOCOL}"://"${GITEA__server__DOMAIN}"
```

Additional Gitea variables are configured in the image [`app.ini`](./instruqt_gitea/src/data/gitea/conf/app.ini) template file. Refer to the [Gitea Configuration Cheat Sheet](https://docs.gitea.io/en-us/config-cheat-sheet/) for full environment variable options.

If the `instruqt_gitea` image is used on other platforms, such as you laptop, the URL format uses to the default URL format.

```bash
GITEA__server__DOMAIN="localhost"
GITEA__server__HTTP_PORT="8443"
GITEA__server__PROTOCOL="https"
GITEA__server__ROOT_URL="${GITEA__server__PROTOCOL}"://"${GITEA__server__DOMAIN}":"${GITEA__server__HTTP_PORT}"
```

>**Note**<p>
> Gitea must use https to match the auto-generated Instruqt URL. The `GITEA__server__HTTP_PORT` value must contain `443`. For example, `8443`, `4443`.
>
> Refer to the [Instruqt documentation](https://docs.instruqt.com/reference/instruqt-platform/networking#authenticated-web-traffic-from-learners) for more details.

### Users

The image creates a student and admin user. Credential details can be changed by declaring the corresponding environment variable in the host sandbox configuration.

#### Student user

| **Field*     | **Default value** | **Environment variable** |
|--------------|-------------------|------------------------- |
| **Username** | student           | STUDENT_USERNAME         |
| **Password** | learn_ansible     | STUDENT_PASSWORD         |
| **E-Mail**   | student@acme.com  | STUDENT_EMAIL            |

#### Admin user

| **Field*     | **Default value** | **Environment variable** |
|--------------|-------------------|------------------------- |
| **Username** | ansible           | ADMIN_USERNAME           |
| **Password** | ansible123!       | ADMIN_PASSWORD           |
| **E-Mail**   | ansible@acme.com  | ADMIN_EMAIL              |

>**Note**<p>
>To add additional users, add the following `gitea` command in the gitea setup-script:
>
>```bash
># create a student user account
>su - git -c '/usr/local/bin/gitea admin user create --admin --username jenkins --password learn_ansible --email jenkins@localhost'

### Using the `instruqt_gitea` image

#### Sandbox host configuration

The `instruqt_gitea` image default values work and it's unnecessary to declare additional environment variables. However, you can override the defaults by specifying environment variables in your Instruqt lab `config.yml` file. For examnple:

```yaml
- name: gitea
  image: quay.io/acme_corp/instruqt_gitea
  ports:
  - 8443
  environment:
    GITEA__server__HTTP_PORT: <custom https port> # Optional
    GITEA__log__LEVEL: debug # Optional
    STUDENT_USERNAME: sean # Optional
    STUDENT_PASSWORD: memeking # Optional
  memory: 512
  ```

Refer to the [Gitea Configuration Cheat Sheet](https://docs.gitea.io/en-us/config-cheat-sheet/) for full environment variable options.

#### Tab configuration

- Title: `gitea` or custom choice
- Type: `Service`
- Host: `gitea` or other name from the environment configuration
- Path: `/student/acme_corp` # This example path opens the `acme_corp` repo for the `student` user.
- Port: `8443`

#### Usage during exercises

Repositories are automatically created with `git push`. For example:

```bash
mkdir test_repo
cd test_repo/
git init
git checkout -b main
touch README.md
git config user.name student
git config user.email student@acme.com
git config http.sslVerify false
git add .
git commit -m"Initial commit"
git remote add origin https://gitea:8443/student/acme_corp.git
git push origin main
```

>**Note**<p>
>Make sure to set `git config http.sslVerify false` to use the self-signed certificate.

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
