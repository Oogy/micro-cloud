# Micro Cloud
Scripts and Configuration management for home cloud machines. 

## Usage
1. Install Ubuntu 20.04
2. Run `init.sh`:

``` sh
apt -y update && apt -y install curl && curl -sL https://raw.githubusercontent.com/Oogy/micro-cloud/main/init.sh | bash -
```
3. Commit any necessary changes to your playbook, they will be automatically pulled and ran by a cron job that runs ansible-pull. 
