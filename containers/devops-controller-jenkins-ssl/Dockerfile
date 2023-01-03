FROM jenkins/jenkins:2.375.1-lts-jdk11

ARG https_port=6443
ARG key_store_password="learn_ansible"

ENV HTTPS_PORT="${https_port}" \
    KEY_STORE_PASSWORD="${key_store_password}"
ENV CASC_JENKINS_CONFIG=/usr/share/jenkins/ref/jenkins_casc.yml \
    JAVA_OPTS="-Djenkins.install.runSetupWizard=false -Djava.net.preferIPv4Stack=true -Dblueocean.collectRuns.threads=50" \
    JENKINS_OPTS="--httpPort=-1 --httpsPort=${HTTPS_PORT} --httpsKeyStore=/var/lib/jenkins/jenkins_keystore.jks --httpsKeyStorePassword=${KEY_STORE_PASSWORD}"

USER root
COPY --chown=jenkins:jenkins src /
RUN apt-get update && apt-get install -y --no-install-recommends \
    subversion \
    python3 \
    python3-pip \
    build-essential \
    git && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/\* /tmp/\* /var/tmp/*
RUN chown -R jenkins:jenkins /var/jenkins_home && \
    jenkins-plugin-cli -f /usr/share/jenkins/ref/plugins.txt
USER jenkins
