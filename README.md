My `$HOME`

Install: `sh install.sh`

Generate ctags
* `ctags -R -f ~/.ctags/tags --extra=+f --exclude=.git --exclude=venv`

Vim jedi setup step
* `git clone --recursive https://github.com/davidhalter/jedi-vim.git ~/.vim/bundle/jedi-vim`

Setup hub for git
* [Create access token](https://docs.github.com/en/github/authenticating-to-github/keeping-your-account-and-data-secure/creating-a-personal-access-token)
* [Create secrets file](https://github.com/github/hub/issues/413#issuecomment-28114178)
