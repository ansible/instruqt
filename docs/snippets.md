# Useful snippets

## code-server settings.json
```
# set vscode default settings
su - $USER -c 'cat >/home/$USER/.local/share/code-server/User/settings.json <<EOL
{
    "git.ignoreLegacyWarning": true,
    "window.menuBarVisibility": "visible",
    "git.enableSmartCommit": true,
    "workbench.tips.enabled": false,
    "workbench.startupEditor": "readme",
    "telemetry.enableTelemetry": false,
    "search.smartCase": true,
    "git.confirmSync": false,
    "workbench.colorTheme": "Solarized Dark",
    "update.showReleaseNotes": false,
    "update.mode": "none",
    "ansible.ansibleLint.enabled": false,
    "ansible.ansible.useFullyQualifiedCollectionNames": true,
    "files.exclude": {
        "**/.*": true
    }
}
EOL
cat /home/$USER/.local/share/code-server/User/settings.json'
```


## `ansible-navigator.yml`
```
# set ansible-navigator default settings
su - $USER -c 'cat >/home/$USER/ansible-navigator.yml <<EOL
---
ansible-navigator:
  execution-environment:
    container-engine: podman
    image: ee-supported-rhel8:2.0.0
    enabled: false

  playbook-artifact:
    save-as: /home/rhel/playbook-artifacts/{playbook_name}-artifact-{ts_utc}.json

  logging:
    level: debug

EOL
cat /home/$USER/ansible-navigator.yml'
```

## podman issue
```
# Fixes an issue with podman that produces this error: "Error: error creating tmpdir: mkdir /run/user/1000: permission denied"
su - $USER -c 'loginctl enable-linger $USER'
```