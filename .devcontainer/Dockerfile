FROM fedora

RUN dnf -y update \
    && dnf -y install \
    python3-pip
    python3-devel
    wget
    vim
    tmux
RUN pip3 install ansible-core


RUN curl -L https://github.com/instruqt/cli/releases/download/2038-91f9762/instruqt-linux-2038-91f9762.zip -o /tmp/instruqt.zip
RUN unzip /tmp/instruqt.zip
# RUN /tmp/instruqt update
RUN cp instruqt /usr/local/bin
RUN chmod +x /usr/local/bin/instruqt
RUN instruqt update