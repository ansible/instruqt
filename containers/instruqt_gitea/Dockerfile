FROM docker.io/gitea/gitea:1.17.4

ARG admin_username="ansible"
ARG admin_password="ansible123!"
ARG admin_email="ansible@acme.com"
ARG student_username="student"
ARG student_password="learn_ansible"
ARG student_email="student@acme.com"
ARG gitea__server__http_port="8443"
ARG gitea__server__protocol="https"
ARG gitea__server__domain="localhost"
ARG gitea__webhook__skip_tls_verify=true

ENV STUDENT_USERNAME="${student_username}" \
STUDENT_PASSWORD="${student_password}" \
STUDENT_EMAIL="${student_email}" \
ADMIN_USERNAME="${admin_username}" \
ADMIN_PASSWORD="${admin_password}" \
ADMIN_EMAIL="${admin_email}" \
GITEA__server__PROTOCOL="${gitea__server__protocol}" \
GITEA__server__HTTP_PORT="${gitea__server__http_port}" \
GITEA__server__DOMAIN="${gitea__server__domain}" \
GITEA__webhook__SKIP_TLS_VERIFY="${gitea__webhook__skip_tls_verify}"

USER root

COPY --chown=git:git src /

RUN chmod 755 /usr/bin/startup.sh
RUN apk --no-cache add \
    python3 \
    subversion \
    tar

CMD ["/usr/bin/startup.sh"]

