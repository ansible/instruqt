Role Name
=========

Manage GCP resources

Example Playbook
----------------

Including an example of how to use your role (for instance, with variables passed in as parameters) is always nice for users too:

    - hosts: localhost
      vars:
        gcp_resources_instances:
          - name: "gcp-instance-name"
            network_interfaces:
              - access_configs:
                  - name: External NAT
                    type: ONE_TO_ONE_NAT
            disks:
              - auto_delete: true
                boot: true
                device_name: "gcp-instance-name-disk"
                initialize_params:
                  source_image: projects/rhel-cloud/global/images/family/rhel-9
                  disk_size_gb: 40
                  disk_type: pd-balanced
            labels:
              label_name: label1
            machine_type: n2-standard-2
            metadata:
              ssh-keys: "{{ lookup('file', '~/.ssh/id_rsa.pub') }}"
            tags:
              items:
                - https-server
      tasks:
        - name: Provision GCP instance
          ansible.builtin.include_role:
            name: gcp_resources
            tasks_from: manage_gcp_instances.yml

License
-------

BSD

Author Information
------------------

An optional section for the role authors to include contact information, or a website (HTML is not allowed).
