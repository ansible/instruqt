# Tracks

## Usage
Use the instruqt cli to pull tracks created from the webui and commit them to this directory. 

### Helpful resources
- [Build your first track](https://docs.instruqt.com/building-tracks/your-first-track)
- [View your tracks logs](https://docs.instruqt.com/building-tracks/viewing-logs)
- [Test your track](https://docs.instruqt.com/publishing-tracks/automated-testing)

## Notes

This is helpful to add an extra pause to ensure the VM is ready before activating the start challenge button
```
#!/bin/bash
until [ -f /opt/instruqt/bootstrap/host-bootstrap-completed ]
do
    sleep 1
done
```
### Name resolution
The name that you have given to each node in the "Environment" section of your track (or `config.yml`) will be propagated to each node in your environment. `ping node{1..2}` should "just work"

### SSH Keys
Instruqt handles root user ssh key management for all nodes so `node1-$ ssh node2` should just work. There is currently no shell for Windows hosts but the windows image configured from this repo installs ssh. The short name defined in the environment for your VM is the hostname used to connect through ssh. 

