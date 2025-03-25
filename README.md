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
    ```
2. Configure browser plugins (e.g,. bitwarden)
3. Update ssh key on Github
4. Update git remote on new machine
    ```bash
    git remote add origin git@github.com:rbetzler/dotfiles.git
    git pull origin master
    ```
5. Push new keys
    ```bash
    git add ~/.encrypted/
    git commit -m "Add sops key for new machine"
    git push
    ```
6. Reencrypt sops files on server
    ```bash
    git pull
    fd enc -I --search-path ~/.encrypted/ -x sops updatekeys --yes
    git add ~/.encrypted/
    git commit -m "Reencrypt sops files for new machine"
    git push
    ```
7. Update ssh keys, first on new machine, then on server
    ```bash
    git pull
    ansible-playbook ~/.playbooks/post.yaml
    git add ~/.encrypted/
    git commit -m "Add ssh keys for new machine"
    git push
    ```
