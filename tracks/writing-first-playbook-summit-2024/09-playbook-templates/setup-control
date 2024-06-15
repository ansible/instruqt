mkdir /home/rhel/ansible-files
chown -R rhel:rhel /home/rhel/ansible-files
touch /etc/sudoers.d/rhel_sudoers
echo "%rhel ALL=(ALL:ALL) NOPASSWD:ALL" > /etc/sudoers.d/rhel_sudoers
cp -a /root/.ssh/* /home/rhel/.ssh/.
chown -R rhel:rhel /home/rhel/.ssh
git config --global user.email "rhel@example.com"
git config --global user.name "Red Hat"
echo "[defaults]" > /home/rhel/.ansible.cfg
echo "inventory = /home/rhel/ansible-files/hosts" >> /home/rhel/.ansible.cfg
echo "host_key_checking = False" >> /home/rhel/.ansible.cfg