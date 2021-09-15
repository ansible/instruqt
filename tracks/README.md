# Tracks

## Usage
Use the instruqt cli to pull tracks created from the webui and commit them to this directory. 

A template track has been created to demonstrate what the fields mean. You can create a copy of this track using the Instruqt CLI like so: `instruqt track create --from redhat/template-slug-url-of-track --title New track slug --slug new slug`

After copying the track, `cd` into the track directory and run `instruqt track push` to push it to our Instruqt organization for further editing.

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

