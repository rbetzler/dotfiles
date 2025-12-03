## My `$HOME`

Borrowed extensively and shamelessly from https://github.com/stpierre/dotfiles (among other sources)

#### Install

1. Run main installs on new machine
    ```bash
    sudo -i exit
    # Install git and ansible, clone dotfiles
    sh <(curl https://raw.githubusercontent.com/rbetzler/dotfiles/refs/heads/master/.bin/install_init.sh)
    # Install via playbooks
    ansible-playbook ~/.playbooks/main.yaml --ask-become-pass --limit localhost -i ~/.playbooks/inventory.yaml
    ```
2. Configure browser plugins. TODO Move into dotfiles.
   * Authenticator
   * Bitwarden
   * Vimium
     ```
     map K previousTab
     map J nextTab
     ```
3. Update ssh key on Github
4. Update git remote on new machine
    ```bash
    git remote add origin git@github.com:rbetzler/dotfiles.git
    git pull origin master
    ```
5. Clone private repos
    ```bash
    export BW_PASSWORD='[PASSWORD]'
    bw config server http[s]://[URL]:[PORT]
    bw login '[USERNAME]'
    export BW_SESSION="$(bw unlock --passwordenv BW_PASSWORD --raw)"
    fnox exec -- ansible-playbook ~/.playbooks/common/git_private.yaml --ask-become-pass --limit localhost -i ~/.playbooks/inventory.yaml
    ```
6. Install mise tools
    ```bash
    mise trust
    mise install
    mise tasks run install
    ```
