# Tracks

## Usage
Use the instruqt cli to pull tracks created from the webui and commit them to this directory. See [Build your first track](https://docs.instruqt.com/building-tracks/your-first-track)

## Notes
This is helpful to add an extra pause to ensure the VM is ready before activating the start challenge button
```
#!/bin/bash
until [ -f /opt/instruqt/bootstrap/host-bootstrap-completed ]
do
    sleep 1
done
```

Instruqt handles root user ssh key management for all nodes so `node1-$ ssh node2` should just work. There is currently no shell for Windows hosts but the windows image configured from this repo installs ssh. The short name defined in the environment for your VM is the hostname used to connect through ssh. 
