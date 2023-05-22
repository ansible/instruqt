#!/bin/bash

/bin/chown -R git:git "${GITEA_CUSTOM}/log"

# Create Gitea users
su - git -c "/usr/local/bin/gitea migrate"
su - git -c "/usr/local/bin/gitea admin user create --username "${GITEA_STUDENT_USERNAME}" --password "${GITEA_STUDENT_PASSWORD}" --email "${GITEA_STUDENT_EMAIL}""
su - git -c "/usr/local/bin/gitea admin user create --admin --username "${GITEA_ADMIN_USERNAME}" --password "${GITEA_ADMIN_PASSWORD}" --email "${GITEA_ADMIN_EMAIL}" --must-change-password=false"

# Unset credential vars
unset GITEA_STUDENT_USERNAME GITEA_STUDENT_PASSWORD GITEA_STUDENT_EMAIL GITEA_ADMIN_USERNAME GITEA_ADMIN_PASSWORD GITEA_ADMIN_EMAIL

#Start Gitea
/bin/s6-svscan /etc/s6
