# https://hub.docker.com/_/fedora
FROM fedora:37

# update and install OS packages
RUN dnf -y update && dnf -y install \
    python3-pip \
    python3-devel \
    wget \
    vim \
    unzip \
    curl \
    git

# install requirements
COPY requirements.txt requirements.txt
RUN pip3 install -r requirements.txt

# configure user and sudo
RUN useradd vscode
RUN sudo sed -e 's/^%wheel/#%wheel/g' -e 's/^# %wheel/%wheel/g' \
  -i /etc/sudoers && \
  usermod -aG wheel vscode

# instruqt cli install
RUN curl -L https://github.com/instruqt/cli/releases/download/2038-91f9762/instruqt-linux-2038-91f9762.zip -o /tmp/instruqt.zip
RUN unzip /tmp/instruqt.zip
# RUN /tmp/instruqt update
RUN cp instruqt /usr/local/bin
RUN chmod +x /usr/local/bin/instruqt
RUN instruqt update