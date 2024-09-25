let
  nixpkgs = fetchTarball "https://github.com/NixOS/nixpkgs/archive/63dacb46bf939521bdc93981b4cbb7ecb58427a0.tar.gz";
  pkgs = import nixpkgs { config = {}; overlays = []; };
  cli = import ./.nixes/cli.nix;
  data = import ./.nixes/data.nix;
  generic = import ./.nixes/generic.nix;
  infra = import ./.nixes/infra.nix;
in
{ nixpkgs ? import <nixpkgs> {} }:

pkgs.mkShell {
  LD_LIBRARY_PATH = "${nixpkgs.stdenv.cc.cc.lib}/lib";
  buildInputs = with pkgs; [
    hello
  ]
  ++ cli.buildInputs
  ++ data.buildInputs
  ++ generic.buildInputs
  ++ infra.buildInputs
  ;
  shellHook = ''
    export IN_WHICH_NIX_SHELL=rlb
  '';
}
