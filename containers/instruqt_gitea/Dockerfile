FROM docker.io/gitea/gitea:1.19

ARG gitea_admin_username="ansible"
ARG gitea_admin_password="ansible123!"
ARG gitea_admin_email="ansible@acme.com"
ARG gitea_student_username="student"
ARG gitea_student_password="learn_ansible"
ARG gitea_student_email="student@acme.com"
ARG gitea__server__http_port="8443"
ARG gitea__server__protocol="https"
ARG gitea__server__domain="localhost"
ARG gitea__webhook__skip_tls_verify=true

ENV GITEA_STUDENT_USERNAME="${gitea_student_username}" \
GITEA_STUDENT_PASSWORD="${gitea_student_password}" \
GITEA_STUDENT_EMAIL="${gitea_student_email}" \
GITEA_ADMIN_USERNAME="${gitea_admin_username}" \
GITEA_ADMIN_PASSWORD="${gitea_admin_password}" \
GITEA_ADMIN_EMAIL="${gitea_admin_email}" \
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