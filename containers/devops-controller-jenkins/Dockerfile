FROM jenkins/jenkins:lts-jdk11

ENV CASC_JENKINS_CONFIG=/usr/share/jenkins/ref/jenkins_casc.yml \
    JAVA_OPTS="-Djenkins.install.runSetupWizard=false -Djava.net.preferIPv4Stack=true -Dblueocean.collectRuns.threads=50"

USER root
COPY --chown=jenkins:jenkins src /
RUN apt-get update && apt-get install -y --no-install-recommends \
    ansible \
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
