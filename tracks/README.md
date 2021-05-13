# Tracks

## Usage
Use the instruqt cli to pull tracks created from the webui and commit them to this directory

## Notes
This is helpful to add an extra pause to ensure the VM is ready before activating the start challenge button
```
#!/bin/bash
until [ -f /opt/instruqt/bootstrap/host-bootstrap-completed ]
do
    sleep 1
done
```
