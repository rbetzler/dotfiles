## My `$HOME`

Borrowed extensively and shamelessly from https://github.com/stpierre/dotfiles (among other sources)

#### Install

```bash
# Install git and ansible, clone dotfiles
sh <(curl https://raw.githubusercontent.com/rbetzler/dotfiles/refs/heads/arch/install.sh)
# Install via playbooks
sudo -i exit
ansible-playbook ~/.playbooks/main.yaml
```

After getting ssh keys configured, update remote

```bash
git remote remove https
git remote add origin git@github.com:rbetzler/dotfiles.git
git pull origin master
```

#### Neovim

Run

```
:PlugInstall
:UpdateRemotePlugins
```
