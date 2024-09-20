let
  nixpkgs = fetchTarball "https://github.com/NixOS/nixpkgs/tarball/nixos-24.05";
  pkgs = import nixpkgs { config = {}; overlays = []; };
in

pkgs.mkShell {
  buildInputs = with pkgs; [
    argo
    argocd
    awscli
    docker
    htop
    kubectl
    kubernetes-helm
    kubeseal
    minikube
    pulumi
  ];
}
