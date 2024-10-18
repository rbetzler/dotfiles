## My `$HOME`

Borrowed extensively and shamelessly from https://github.com/stpierre/dotfiles (among other sources)

#### Install

```bash
~/.installers/00_git.sh
~/.installers/01_zsh.sh
~/.installers/02_pacman.sh
~/.installers/03_yay.sh
~/.installers/04_nix.sh
~/.installers/05_other.sh
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
