---
slug: install-signed-collections
id: ytivx8htgeg1
type: challenge
title: Install the signed collections from private automation hub instance.
teaser: Learn how to use the ansible-galaxy CLI to pull the signed content collections
  from the private automation hub instance.
notes:
- type: text
  contents: '#### **Install** the signed collections from private automation hub instance.'
tabs:
- title: automationhub-terminal
  type: terminal
  hostname: privatehub-01
difficulty: basic
timelimit: 500
---
Now that we have signed and published Ansible Content Collections to our private automation hub, we will learn how to install a signed collection and which new cli options are available with `ansible-galaxy` CLI to support the signing feature.

Let's go through the following steps on the `automationhub-terminal` tab:
***

## 1. Adding the public key to a GPG keyring on the system.
In the start of the section we explained a bit about the public key(`galaxy_signing_service.asc`) being provided with the lab to verify and install the signed collections. You will have to add the public key to a GPG keyring on the system, in order to use it with `ansible-galaxy` CLI, please run the following command:
```
gpg --import --no-default-keyring --keyring ~/keyring.kbx galaxy_signing_service.asc
```
*Note:* You can also use the default keyring by removing the `--no-default-keyring` option,the command would then become

```
gpg --import galaxy_signing_service.asc
```
Above command will create a default keyring in the `~/.gnupg/` location called `pubring.kbx`. In this case, your keyring would be `/home/rhel/.gnupg/pubring.kbx`.
***
## 2. Install a collection without the `--keyring` option in `ansible-galaxy` CLI
Signature verification process is purely opt-in and in case you don't provide the `--keyring` option of `ansible-galaxy` CLI, the collection install will happen without the signature verification.
We will install the `ansible.test_collection` without verification, you will observe that `ansible-galaxy` CLI now throws a warning about signature verification.
Run the following command:
```
ansible-galaxy collection install ansible.test_collection -c
```

The output will show a warning as below:
```
[WARNING]: The GnuPG keyring used for collection signature verification was not configured but signatures were provided by the Galaxy server to verify authenticity. Configure a
keyring for ansible-galaxy to use or disable signature verification. Skipping signature verification.
```
***
## 3. Install a collection with the `--keyring` option in `ansible-galaxy` CLI
We will now install the `community.lab_collection` with the `--keyring` option. This will ensure that the collection is installed after the signature verification, to check if the signature verification is happening, you will need to add `-vvvv` to collection install command.
Run the following command:
```
ansible-galaxy collection install community.lab_collection --keyring /home/rhel/keyring.kbx -c -vvvv
```
*Note:* The last three lines of the verbose output will show you that the signature verification was successful.
```
.
.
.
(exit code 0)
GnuPG signature verification succeeded for community.lab_collection
community.lab_collection:1.0.0 was installed successfully
```
***
## 4. New Artifacts with collection install.
With the signed collection, `ansible-galaxy` CLI also creates a new directory with a file called `GALAXY.yml` that contains the collection signatures.
Run the following command on the `automationhub-terminal`
```
cat ~/.ansible/collections/ansible_collections/community.lab_collection-1.0.0.info/GALAXY.yml
```
This will give you the contents of the file that contains the collection signature.
***
## 5. Congratulations! Now you have installed the signed collections from the private automation hub instance, click on **Check** for the next exercise.