#!/bin/sh
set -e

# that all scripts have "set -e" at the top of the bash file!
# Fix AIDE
cd /var/lib/aide/ && rm -rf * && \
cp /etc/aide.conf /etc/aide.conf.ORIG && \
/root/scripts/bash_remediate_scripts/xccdf_org.ssgproject.content_rule_aide_build_database.sh && \
/root/scripts/bash_remediate_scripts/xccdf_org.ssgproject.content_rule_aide_check_audit_tools.sh && \
/root/scripts/bash_remediate_scripts/xccdf_org.ssgproject.content_rule_aide_verify_acls.sh && \
/root/scripts/bash_remediate_scripts/xccdf_org.ssgproject.content_rule_aide_verify_ext_attributes.sh && \

# Fix crypto
/root/scripts/bash_remediate_scripts/xccdf_org.ssgproject.content_rule_harden_sshd_ciphers_openssh_conf_crypto_policy.sh && \
/root/scripts/bash_remediate_scripts/xccdf_org.ssgproject.content_rule_harden_sshd_macs_openssh_conf_crypto_policy.sh && \

# Fix Pam and password related hits
/root/scripts/bash_remediate_scripts/xccdf_org.ssgproject.content_rule_accounts_password_pam_pwhistory_remember_password_auth.sh && \
/root/scripts/bash_remediate_scripts/xccdf_org.ssgproject.content_rule_accounts_password_set_min_life_existing.sh && \
/root/scripts/bash_remediate_scripts/xccdf_org.ssgproject.content_rule_accounts_passwords_pam_faillock_deny.sh && \
/root/scripts/bash_remediate_scripts/xccdf_org.ssgproject.content_rule_display_login_attempts.sh && \
/root/scripts/bash_remediate_scripts/xccdf_org.ssgproject.content_rule_no_empty_passwords.sh && \

# Fix permission related hits 
/root/scripts/bash_remediate_scripts/xccdf_org.ssgproject.content_rule_accounts_users_home_files_permissions.sh && \
/root/scripts/bash_remediate_scripts/xccdf_org.ssgproject.content_rule_kernel_module_bluetooth_disabled.sh && \
/root/scripts/bash_remediate_scripts/xccdf_org.ssgproject.content_rule_sssd_enable_smartcards.sh && \
/root/scripts/bash_remediate_scripts/xccdf_org.ssgproject.content_rule_sssd_offline_cred_expiration.sh && \
/root/scripts/bash_remediate_scripts/xccdf_org.ssgproject.content_rule_usbguard_generate_policy.sh