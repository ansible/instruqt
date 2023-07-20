---
slug: url-check-plugin
id: jnf5we8tay7i
type: challenge
title: 'Getting Started: URL Check Example'
teaser: We will now use the URL Check plugin to run a continuous check on a URL page.
  In this example we will try and simulate a failure and remediate that failure.
notes:
- type: text
  contents: Now, lets try with the URL Check plugin. This is a pretty simple plugin,
    but it allows us to poll the status of web sites and we can then act on any issues
    that might come up!
tabs:
- title: editor
  type: code
  hostname: ansible-rulebook
  path: /root
- title: ansible-rulebook
  type: terminal
  hostname: ansible-rulebook
- title: Terminal
  type: terminal
  hostname: ansible-rulebook
- title: Webserver
  type: terminal
  hostname: webserver
difficulty: basic
timelimit: 600
---
 ☑️ URL Check Source
===

In this example we are going to use the simple URL Check source plugin to check if a webpage is up and running and if not, we can try to remediate it.


- From the _editor_ tab, inspect the `url-check-example.yml` rulebook. Take note of the source plugin that we are using.

- See that the source is pointing to a URL. We can point to multiple URLs and configure a delay that allows `ansible-rulebook` to  check the webservers on an ongoing basis.

- The url-check source plugin is a very simple plugin, if the webserver responds with a page then the url is considered 'up' if there is no page then its considered 'down'. Stopping the webserver will ultimately stop `ansible-rulebook` from running as it would not be able to connect to it.

- In this example we are going to keep `ansible-rulebook` running and checking our webserver while we remove the index.html page.

- Once the page is missing, `ansible-rulebook` will attempt to trigger a playbook to remediate the situation.

 So, lets try this

Navigate to the _ansible-rulebook_ tab, and lets get the rulebook running:

`ansible-rulebook --rulebook url-check-example.yml -i inventory_web.yml --print-events`

**Note**: we are using another inventory file for this exercise

Now that we have `ansible-rulebook` is checking that url

- From the _terminal_ tab, lets do a curl to make sure we can see a page on the webserver

`curl webserver`

- We should have gotten a very basic webpage in response to our curl.

- Take a look at the _ansible-rulebook_ tab and observe the messages. We can see the page is live and therefore we are triggering a playbook to say all is well.

-  From the _webserver_ tab, lets create a failure scenario by deleting the index.html file that is currently being served from `/var/www/html/`

`sudo rm /var/www/html/index.html`

- Now that we have removed the index.html page being hosted, after the delay _ansible-rulebook_ will notice the failed state and try to remediate by running a remediation playbook.


>     TASK [debug]
>     *******************************************************************
>     ok: [webserver] => {
>         "msg": "Website is down!" }
>
>     TASK [Replace website]
>     *********************************************************
>     changed: [webserver]
>
>     PLAY RECAP
>     ********************************************************************* webserver
>     : ok=2    changed=1    unreachable=0    failed=0    skipped=0    rescued=0    ignored=0

- Once remediated, the delayed checks will continue.

This completes this example
