set -gx STARSHIP_CACHE ~/.cache/starship/logs/fish
set -gx STARSHIP_CONFIG ~/.config/starship/config.toml

if status is-interactive
    starship init fish | source
end
