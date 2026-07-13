set -gx STARSHIP_CACHE ~/.cache/starship/logs/fish
set -gx STARSHIP_CONFIG ~/.config/starship/config.toml

set -U fish_greeting ""

if status is-interactive
    starship init fish | source
end
