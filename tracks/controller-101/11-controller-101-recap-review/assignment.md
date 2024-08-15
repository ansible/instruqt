---
slug: controller-101-recap-review
id: oqaabgopgnkl
type: challenge
title: Recap and review
teaser: Review the Views section again to see everything we did
notes:
- type: text
  contents: |-
    # Recap and Review

    Let's take a few minutes to review what we did until now and ask some questions if you have any doubts!
tabs:
- title: Automation controller
  type: service
  hostname: control
  path: /
  port: 443
- title: Node1 Web
  type: service
  hostname: node1
  path: /
  port: 80
difficulty: basic
timelimit: 600
---
📊 Recap and review
===
#### Estimated time to complete: *5 minutes*<p>

Now that we have created our Inventory, Projects and Job Templates, as well as run a full Workflow, let's get back to the **Views** section and look a bit at the new graphs and data shown in each of them.

☑️ Task 1 - Review the Dashboard view
===

1. Visit the **Dashboard** view and notice the difference when we first started. You should be seeing 4 hosts, 2 inventories and 3 projects. Also, you will notice a green line in the graph, showing the successful executions of our Job Templates.
2. You can dive deeper by clicking on the **Recent Jobs** and **Recent Templates** tabs right above the line graph.

![dashboard-review.png](../assets/dashboard-review.png)

☑️ Task 2 - Review the Jobs view
===

1. Another way to look at the executed jobs is to go to the **Jobs** link in the sidebar, under the **Views** section.
2. Notice they are not only **Playbook runs**, but also **Source control updates**. The **Jobs** view will show everything we **Launched** (rocket icon).

![jobs-review.png](../assets/jobs-review.png)

☑️ Task 3 - Review the Activities Stream view
===

1. In the **Activities Stream** view you will see the individual **Events** that are executed as part of our different tasks. You will notice this are more granular and include the user who run them.

![activities-review.png](../assets/activities-review.png)

🎉 Success!
===

Congratulations on finishing the **Introduction to automation controller** laboratory.

> [!IMPORTANT]
> Please click the green [Next] button at the bottom one last time to complete the lab, and remember to review and leave a comment. We appreciate all feedback!

	🐛 Encountered an issue?
====

If you have encountered an issue or have noticed something not quite right, please [open an issue](https://github.com/ansible/instruqt/issues/new?labels=writing-first-playbook&title=Issue+with+Intro+to+Controller+slug+ID:+recap&assignees=leogallego).


When you are done, we invite  you to find more information about Ansible at [Ansible.com](https://www.ansible.com)

Did you like Ansible automation controller? [Try the full Ansible Automation Platform today!](https://www.redhat.com/en/technologies/management/ansible/trial?)

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
