## My `$HOME`

Borrowed extensively and shamelessly from https://github.com/stpierre/dotfiles (among other sources)

#### Install

1. On local
    ```bash
    sudo -i exit
    # Install git and ansible, clone dotfiles
    sh <(curl https://raw.githubusercontent.com/rbetzler/dotfiles/refs/heads/master/install.sh)
    # Install via playbooks
    ansible-playbook ~/.playbooks/main.yaml
    git add ~/.encrypted/
    git commit -m "Add sops key for new machine"
    git push
    ```
2. Reencrypt sops files on server
    ```bash
    git pull
    fd enc -I --search-path ~/.encrypted/ -x sops updatekeys --yes
    git add ~/.encrypted/
    git commit -m "Reencrypt sops files for new machine"
    git push
    ```
3. Update ssh keys, first on new machine, then on server
    ```bash
    git pull
    ansible-playbook ~/.playbooks/post.yaml
    git add ~/.encrypted/
    git commit -m "Add ssh keys for new machine"
    git push
    ```
4. Update ssh key on Github
5. Update git remote on new machine
    ```bash
    git remote add origin git@github.com:rbetzler/dotfiles.git
    git pull origin master
    ```
6. Configure browser plugins (e.g,. bitwarden)
