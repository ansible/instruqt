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
GITEA__webhook__SKIP_TLS_VERIFY=true
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

| **Field**     | **Default value** | **Environment variable** |
|--------------|-------------------|-------------------------  |
| **Username** | student           | GITEA_STUDENT_USERNAME    |
| **Password** | learn_ansible     | GITEA_STUDENT_PASSWORD    |
| **E-Mail**   | student@acme.com  | GITEA_STUDENT_EMAIL       |

#### Admin user

| **Field**     | **Default value** | **Environment variable** |
|--------------|-------------------|-------------------------  |
| **Username** | ansible           | GITEA_ADMIN_USERNAME      |
| **Password** | ansible123!       | GITEA_ADMIN_PASSWORD      |
| **E-Mail**   | ansible@acme.com  | GITEA_ADMIN_EMAIL         |

>**Note**<p>
>To add additional users, add the following `gitea` command in the gitea setup-script:
>
>```bash
># create a student user account
>su - git -c '/usr/local/bin/gitea admin user create --admin --username jenkins --password learn_ansible --email jenkins@localhost'

### Using the `instruqt_gitea` image

The default configuration works for Instruqt use. It is, however, possible to change the configuration using environment variables if needed.

#### Sandbox host custom configuration example

The `instruqt_gitea` image default values work and it's unnecessary to declare additional environment variables. However, you can override the defaults by specifying environment variables in your Instruqt lab `config.yml` file. For examnple:

```yaml
- name: gitea
  image: quay.io/acme_corp/instruqt_gitea
  ports:
  - 8443
  environment:
    GITEA__server__HTTP_PORT: <custom https port> # Optional
    GITEA__log__LEVEL: debug # Optional
    GITEA_STUDENT_USERNAME: sean # Optional
    GITEA_STUDENT_PASSWORD: memeking # Optional
  memory: 512
  ```

Refer to the [Gitea Configuration Cheat Sheet](https://docs.gitea.io/en-us/config-cheat-sheet/) for full environment variable options.

#### Tab configuration

- Title: `gitea` or custom choice
- Type: `Service`
- Host: `gitea` or other name from the environment configuration
- Path: `/student/acme_corp` <== This example path opens the `acme_corp` repo for the `student` user.
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
  - 6443
  environment:
    JENKINS_CONTROLLER_PASSWORD: learn_ansible
    JENKINS_CONTROLLER_URL: https://controller
    JENKINS_GITEA_SERVER_URL: https://gitea:8443
    JENKINS_ADMIN_PASSWORD: learn_ansible
    JENKINS_REPO_PASSWORD: learn_ansible
  memory: 2048
  ```

### Available environment variables

| **Environment variable**            | **Default value**     | **Field**                                    |
|-------------------------------------|-----------------------|----------------------------------------------|
| JENKINS_CONTROLLER_STUDENT_USERNAME | student               | Student controller username for API calls    |
| JENKINS_CONTROLLER_STUDENT_PASSWORD | learn_ansible         | Student controller password for API calls    |
| JENKINS_CONTROLLER_USERNAME         | jenkins               | Jenkins controller username for API calls    |
| JENKINS_CONTROLLER_PASSWORD         | learn_ansible         | Jenkins controller password for API calls    |
| JENKINS_REPO_USERNAME               | jenkins               | Jenkins repo username for repo writes        |
| JENKINS_REPO_PASSWORD               | learn_ansible         | Jenkins repo password for repo writes        |
| JENKINS_ADMIN_USERNAME              | admin                 | Jenkins admin username                       |
| JENKINS_ADMIN_PASSWORD              | ansible123!           | Jenkins admin password                       |
| JENKINS_STUDENT_USERNAME            | student               | Jenkins student username                     |
| JENKINS_STUDENT_PASSWORD            | learn_ansible         | Jenkins student password                     |
| JENKINS_CONTROLLER_URL              | https://controller    | Controller URL                               |
| JENKINS_GITEA_SERVER_URL            | https://gitea:8443    | Gitea URL                                    |
| JENKINS_SERVER_URL                  | https://jenkins:6443  | Jenkins root URL                             |
| JENKINS_HTTPS_PORT                  | 6443                  | Jenkins HTTPS port                           |
| JENKINS_KEY_STORE_PASSWORD          | learn_ansible         | Jenkins certificate store password           |

## Jenkins DevOps SSL Instruqt Image

The `instruqt-jenkins-devops-ssl` image is similar to the above `instruqt-jenkins-devops` with the addition of an self-signed certificate and default https configuration. The following configuration files are used:

- [Dockerfile](../containers/devops-controller-jenkins-ssl/Dockerfile)
- Jenkins CASC [configuration file](../containers/devops-controller-jenkins-ssl/src/usr/share/jenkins/ref/jenkins_casc.yml)
- Jenkins [Plugins list](../containers/devops-controller-jenkins-ssl/src/usr/share/jenkins/ref/plugins.txt)

### Instruqt environment configuration

The example below shows configurable Instruqt variables and the corresponding default values.

```yaml
- name: jenkins
  image: quay.io/acme_corp/instruqt-jenkins-devops-ssl
  ports:
  - 6443
  environment:
    JENKINS_CONTROLLER_PASSWORD: learn_ansible
    JENKINS_CONTROLLER_URL: https://controller
    JENKINS_GITEA_SERVER_URL: https://gitea:8443
    JENKINS_ADMIN_PASSWORD: learn_ansible
    JENKINS_REPO_PASSWORD: learn_ansible
    JENKINS_HTTPS_PORT: 6443
  ```

