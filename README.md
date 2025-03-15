## My `$HOME`

Borrowed extensively and shamelessly from https://github.com/stpierre/dotfiles (among other sources)

#### Install

```bash
sudo -i exit
# Install git and ansible, clone dotfiles
sh <(curl https://raw.githubusercontent.com/rbetzler/dotfiles/refs/heads/arch/install.sh)
# Install via playbooks
ansible-playbook ~/.playbooks/main.yaml
```

Add ssh keys
* Github
* Homelab

```bash
git remote add origin git@github.com:rbetzler/dotfiles.git
git pull origin master
```
