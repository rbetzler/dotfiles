## My `$HOME`

Borrowed extensively and shamelessly from https://github.com/stpierre/dotfiles (among other sources)

#### Install

1. Run main installs on new machine.
    ```bash
    sudo -i exit
    # Install git and ansible, clone dotfiles
    sh <(curl https://raw.githubusercontent.com/rbetzler/dotfiles/refs/heads/master/.bin/install_init.sh)
    # Install via playbooks
    ansible-playbook ~/.playbooks/machines/laptop.yaml --ask-become-pass --limit localhost -i ~/.playbooks/inventory.yaml
    ```
2. Install mise tools.
    ```bash
    mise trust
    mise install
    ```
3. Configure browser plugins. TODO Move into dotfiles.
    * Authenticator
    * Bitwarden
    * [Firefox](https://addons.mozilla.org/en-US/firefox/addon/dracula-dark-colorscheme/)
    * [GDoc Dark Mode](https://addons.mozilla.org/en-US/firefox/addon/docsafterdark/)
    * Stylus, then install themes:
        * https://draculatheme.com/github
        * https://draculatheme.com/google-search
    * Vimium
        ```
        map K previousTab
        map J nextTab
        ```
4. Update ssh key on Github.
5. Install optional extras.
    ```bash
    sops ~/.encrypted/install_post.sh.enc
    ```
