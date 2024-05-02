{ inputs, pkgs, ... }:
let
  system = pkgs.devenv.system;
in
{
  packages = [
    inputs.example.packages.${system}.default
  ];
}
