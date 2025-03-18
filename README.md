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
    sops --config ~/.encrypted/.sops.yaml updatekeys --yes ~/.encrypted/authorized_keys.enc
    sops --config ~/.encrypted/.sops.yaml updatekeys --yes ~/.encrypted/public.enc.yaml
    git add ~/.encrypted/
    git commit -m "Reencrypt sops files for new machine"
    git push
    ```
3. Update ssh keys, first on new machine, then on server
    ```bash
    ansible-playbook ~/.playbooks/sync_ssh_setup.yaml
    ```
4. Update ssh key on Github
5. Update git remote on new machine
    ```bash
    git remote add origin git@github.com:rbetzler/dotfiles.git
    git pull origin master
    ```
6. Configure browser plugins (e.g,. bitwarden)
