---
slug: curator-approve-collection
id: flbyvg1ed1zo
type: challenge
title: Approve collections as curator
teaser: In this challenge, we will show how a curator can see the import logs and
  approve/reject collection in private automation hub
tabs:
- title: automationhub-web
  type: service
  hostname: privatehub-01
  path: /
  port: 443
- title: automationhub-terminal
  type: terminal
  hostname: privatehub-01
difficulty: basic
timelimit: 400
---

🔐 Login credentials

>User: curator<p>
>Password: learn_ansible

In this challenge, we will login as **curator** user to approve and publish the pushed collections from the previous challenges.

☑️ Task 1 - Approve collections as the curator user
===

* Login to the `automationhub-web` tab as **curator** user.
* Go through the below screenshots to understand how a curator can check import logs and approve or reject a collection.

<!-- ![View Import Logs](../assets/view_import_logs.png
) -->
<a href="#view_import_logs">
  <img alt="View Import Logs" src="../assets/view_import_logs.png" />
</a>
<a href="#" class="lightbox" id="view_import_logs">
  <img alt="View Import Logs" src="../assets/view_import_logs.png" />
</a>

<!-- ![Approve Collection](../assets/approve_collections.png
) -->
<a href="#approve_collection">
  <img alt="Approve Collection" src="../assets/approve_collections.png" />
</a>
<a href="#" class="lightbox" id="approve_collection">
  <img alt="Approve Collection" src="../assets/approve_collections.png" />
</a>

* Logout as **curator** once collections are approved.

<!-- ![Curator Logout](../assets/curator_logout.png
) -->
<a href="#curator_logout">
  <img alt="Curator Logout" src="../assets/curator_logout.png" />
</a>
<a href="#" class="lightbox" id="curator_logout">
  <img alt="Curator Logout" src="../assets/curator_logout.png" />
</a>


☑️ Task 2 - Login as marie/bob user to see if collections are published.
===

* Logout as curator user.
* Login as **marie** use to check if collections are published, check screenshots below.

<!-- ![Check Collections](../assets/marie_user_show_collections.png
) -->
<a href="#check_collections">
  <img alt="Check Collectiobs" src="../assets/marie_user_show_collections.png" />
</a>
<a href="#" class="lightbox" id="check_collections">
  <img alt="Check Collections" src="../assets/marie_user_show_collections.png" />
</a>

☑️ Summary
===
* Curator can approve or reject collections based on their import logs.
* Once a collection is published, any user should be able to view and download collections from private automation hub.

✅ The End
===
This marks the end of this lab. We hope that you enjoyed learning about private automation hub.

🐛 Encountered an issue?
====
If you have encountered an issue or have noticed something not quite right, please [open an issue](https://github.com/ansible/instruqt/issues/new).

<style type="text/css" rel="stylesheet">
  .lightbox {
    display: none;
    position: fixed;
    justify-content: center;
    align-items: center;
    z-index: 999;
    top: 0;
    left: 0;
    right: 0;
    bottom: 0;
    padding: 1rem;
    background: rgba(0, 0, 0, 0.8);
    margin-left: auto;
    margin-right: auto;
    margin-top: auto;
    margin-bottom: auto;
  }
  .lightbox:target {
    display: flex;
  }
  .lightbox img {
    /* max-height: 100% */
    max-width: 60%;
    max-height: 60%;
  }
  img {
    display: block;
    margin-left: auto;
    margin-right: auto;
    width: 100%;
  }
  h1 {
    font-size: 18px;
  }
    h2 {
    font-size: 16px;
    font-weight: 600
  }
    h3 {
    font-size: 14px;
    font-weight: 600
  }
  p span {
    font-size: 14px;
  }
  ul li span {
    font-size: 14px
  }
</style>