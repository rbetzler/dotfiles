## My `$HOME`

Borrowed extensively and shamelessly from https://github.com/stpierre/dotfiles (among other sources)

#### Install

1. Run main installs on new machine
    ```bash
    sudo -i exit
    # Install git and ansible, clone dotfiles
    sh <(curl https://raw.githubusercontent.com/rbetzler/dotfiles/refs/heads/master/.bin/install_init.sh)
    # Install via playbooks
    ansible-playbook ~/.playbooks/main.yaml --ask-become-pass
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
5. Reencrypt sops files, put new pub key on server. See script (or private repo or bw note) for required environment variables.
    ```bash
    ~/.bin/install_keys.sh
    ```
6. Clone private repos
    ```bash
    ansible-playbook ~/.playbooks/git_private.yaml
    ```
7. Verify, commit updated sops files
    ```bash
    git add ~/.encrypted/
    git commit -m "Reencrypt sops files for new machine"
    git push
    ```
8. Install mise tools
    ```bash
    mise trust
    mise install
    mise tasks run install
    ```

#### Fnox

To authenticate to a bitwarden provider

```bash
export BW_PASSWORD='[PASSWORD]'
bw config server http[s]://[URL]:[PORT]
bw login '[username]'
export BW_SESSION="$(bw unlock --passwordenv BW_PASSWORD --raw)"
```
