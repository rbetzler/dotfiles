# Source os specific shell configs
if grep --quiet Ubuntu /etc/os-release; then
  alias bat="batcat --theme Dracula"
  alias fd="fdfind"
fi
