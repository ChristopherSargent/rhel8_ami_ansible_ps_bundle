![alt text](ecs.logo.JPG)
* This repository contains ans ansible role and scripts from Ironbank for RHEL8 DISA Stig Hardening. Note the role is to configure the DEC-AWS ami-06ffd64772897d8b0 (RHEL8-LVM-STIG-06282023-NB-AMI) to work in PreStaging. For any additional details or inquiries, please contact us at c.sargent-ctr@ecstech.com.

* Deployed EC2 from ami-06ffd64772897d8b0 (RHEL8-LVM-STIG-06282023-NB-AMI) Red Hat 8 on t2.large with public IP and using ECE-Installer-20200811_010627 key.

# Configure ansible logging
```
1. ssh -i /root/ecs/ECE-Installer-20200811_010627.pem ec2-user@PublicIP
2. sudo -i 
3. cp /etc/ansible/ansible.cfg /etc/ansible/ansible.cfg.ORIG
4. sed -i -e 's|#log_path|log_path|g' /etc/ansible/ansible.cfg
```

# Run playbook
* Note the playbook fixes network issues so you will need to clone or download the .zip file and scp it to the ec2 instance
```
1. scp -i /root/ecs/ECE-Installer-20200811_010627.pem rhel8_ami_ansible_ps_bundle.tar.gz ec2-user@PublicIP: 
2. ssh -i /root/ecs/ECE-Installer-20200811_010627.pem ec2-user@PublicIP
3. sudo -i 
4. cd /home/ec2-user
5. mkdir rhel8_ami_ansible_ps_bundle 
6. mv rhel8_ami_ansible_ps_bundle.tar.gz rhel8_ami_ansible_ps_bundle
7. cd rhel8_ami_ansible_ps_bundle
8. tar -xzvf rhel8_ami_ansible_ps_bundle.tar.gz
9. cd /home/ec2-user/rhel8_ami_ansible_ps_bundle/ansible/rhel8_ami_ansible_ps
10. ansible-playbook -i "localhost," -c local rhel8_ami_ansible_ps.yml -vvv
11. exit 
* Note you have to exit here as proxy settings were added via proxy.sh in /etc/profile.d which has been removed
12. sudo -i 
13. curl ipinfo.io should now be able to reach out
```
