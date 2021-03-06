# Micro Cloud
Scripts and Configuration management for home cloud machines. 

## Usage
1. Fork and edit.
### Warning: SSH Public Keys exist in `roles/micro-cloud/vars/main.yml` and are installed - these should be removed/edited before proceeding. 
2. Install Ubuntu 20.04(Be sure to configure a non-root user)
3. Run:

``` sh
read -p "Github User: " GITHUB_USER && sudo apt -y update && sudo apt -y install curl && curl -sL https://raw.githubusercontent.com/$GITHUB_USER/micro-cloud/main/init.sh | sudo -E bash -s -- $GITHUB_USER
```
This will setup a crontab to run ansible-pull against your fork. 

3. Commit any necessary changes to your playbook, changes will be automatically applied via the cron job.
