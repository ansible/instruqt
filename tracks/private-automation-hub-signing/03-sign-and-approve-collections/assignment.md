---
slug: sign-and-approve-collections
id: frws8uf5aw6y
type: challenge
title: Sign and Approve the Ansible Content Collections from the private automation
  hub UI.
teaser: In this challenge you will Sign and approve the published Ansible content
  collectons.
notes:
- type: text
  contents: |
    #### **Sign and Approve** the Ansible Content Collections from the private automation hub UI.
tabs:
- title: automationhub-web
  type: service
  hostname: privatehub-01
  port: 443
difficulty: basic
timelimit: 400
---
In this challenge we will sign and approve the published Ansible Content Collection, the only tab available for this challenge is `automationhub-web`, as the private automation hub is enabled to stage any incoming collections for signing and approval.
Go through the following steps:
***

## 1. Login to private automation hub instance in the automationhub-ui tab using below credentials:
```
Username: admin
Password: ansible123!
```
***
## 2. Once you are logged in, click the Collections `>` Approval from the Navigator Pane on the left hand side:

![](../assets/signing_approval.png "")
***
## 3. As we published the collections in the last exercise, In the Approval page you will now see the **Sign and approve** button in front of both the collections that we pushed.
Click on the **Sign and approve** button for both the collections.
![](../assets/signing_review.png "")
***
## 4. You have now signed and published both collections, they will now show up in the **Collections** page as signed.
![](../assets/signing_collections_screen.png "")
***
## 5. Congratulations! Now you have signed the collections on the private automation hub instance, click on **Check** for the next challenge.
