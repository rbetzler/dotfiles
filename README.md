## My `$HOME`

Borrowed extensively and shamelessly from https://github.com/stpierre/dotfiles (among other sources)

#### Install

```bash
sudo -i exit
~/install.sh
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
