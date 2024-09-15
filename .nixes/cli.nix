let
  nixpkgs = fetchTarball "https://github.com/NixOS/nixpkgs/tarball/nixos-24.05";
  pkgs = import nixpkgs { config = {}; overlays = []; };
in

pkgs.mkShell {
  buildInputs = with pkgs; [
    age
    autojump
    bat
    delta
    eza
    fd
    fzf
    gawk
    gh
    jq
    pandoc
    pgcli
    sd
    sops
    terminator
    tre-command
    unzip
    vgrep
    zsh
  ];
}
