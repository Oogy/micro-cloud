# Micro Cloud
Scripts and Configuration management for home cloud machines. 

## Usage
1. Install Ubuntu 20.04(Be sure to configure a non-root user)
2. Run `init.sh`:

``` sh
read -p "Github User: " GITHUB_USER && sudo apt -y update && sudo apt -y install curl && curl -sL https://raw.githubusercontent.com/$GITHUB_USER/micro-cloud/main/init.sh | sudo -E bash - $GITHUB_USER
```
3. Commit any necessary changes to your playbook, they will be automatically pulled and ran by a cron job that runs ansible-pull. 
