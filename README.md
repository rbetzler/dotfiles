## My `$HOME`

Borrowed extensively and shamelessly from https://github.com/stpierre/dotfiles (among other sources)

#### Install
```sh
git init
git remote add origin git@github.com:rbetzler/dotfiles.git
git pull origin master

sudo bash install.sh
```

#### Basics
* `zsh` for shell, with `oh-my-zsh` for plugins
* `vim` for text editing, with `vundle` for (most) plugins
* `mutt` for emails, with `isync` to handle them
* `ipython` for py dev work
* `gh` to help with github
* Random cli tools `bat`, `exa`, `vgrep`, etc.
* Lots of git aliases
* Some general data-related bash scripts to make life easier

#### Cron
Currently, my crontab looks like:
```
*/20 * * * * bash -c "source /home/nautilus/.general/sync_mailboxes && sync_mailboxes"
```
which I will need to find a way to streamline...

#### Mutt address book
This looks like so
```
alias me <me@gmail.com>
```

#### Asciinema
```
# Record locally
asciinema rec /tmp/recording

# Convert file types
agg /tmp/recording /tmp/recording.gif
```

#### Docker image
Run:
```
docker build --tag rlb-env - < Dockerfile
docker run -it --rm -v $HOME/:/mnt -w /mnt rlb-env -c "ln -s /mnt/.ssh /root && zsh"
```
* The second command is a hacky way to run a symbolic link then stay in the container.
  Otherwise, docker will exit abruptly.
* The symlink is needed to make root ssh keys accessible.
