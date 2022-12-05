#!/bin/bash

/bin/chown -R git:git "${GITEA_CUSTOM}/log"
# Set Gitea vars to match Instruqt env else use normal format. Keep export order.
if [ -z "${INSTRUQT_PARTICIPANT_ID}" ] && [ -z "${INSTRUQT_PARTICIPANTS_DNS}" ]; then
    export GITEA__server__DOMAIN="${GITEA__server__DOMAIN}"
    export GITEA__server__ROOT_URL="${GITEA__server__PROTOCOL}"://"${GITEA__server__DOMAIN}":"${GITEA__server__HTTP_PORT}"
else
    export GITEA__server__DOMAIN="${HOSTNAME}"-"${GITEA__server__HTTP_PORT}"-"${INSTRUQT_PARTICIPANT_ID}"."${INSTRUQT_PARTICIPANTS_DNS}"
    export GITEA__server__ROOT_URL="${GITEA__server__PROTOCOL}"://"${GITEA__server__DOMAIN}"
fi

# Create Gitea users
su - git -c "/usr/local/bin/gitea migrate"
su - git -c "/usr/local/bin/gitea admin user create --username "${STUDENT_USERNAME}" --password "${STUDENT_PASSWORD}" --email "${STUDENT_EMAIL}""
su - git -c "/usr/local/bin/gitea admin user create --admin --username "${ADMIN_USERNAME}" --password "${ADMIN_PASSWORD}" --email "${ADMIN_EMAIL}" --must-change-password=false"

# Unset credential vars
unset STUDENT_USERNAME STUDENT_PASSWORD STUDENT_EMAIL ADMIN_USERNAME ADMIN_PASSWORD ADMIN_EMAIL

#Start Gitea
/bin/s6-svscan /etc/s6
