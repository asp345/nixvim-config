{
  description = "Personal nixvim configuration";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    nixvim = {
      url = "github:nix-community/nixvim";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs =
    {
      nixpkgs,
      nixvim,
      ...
    }:
    let
      system = "x86_64-linux";
      pkgs = import nixpkgs {
        inherit system;
        overlays = [
          (_final: prev: {
            kulala-core = prev.kulala-core.overrideAttrs (old: {
              node_modules = old.node_modules.overrideAttrs (_: {
                outputHash = "sha256-XQlBawD3vt8pVc7Gy9XeiGie89HWbljNJt7kUEDaDKk=";
              });
            });
          })
        ];
        config.allowUnfreePredicate =
          pkg: builtins.elem (nixpkgs.lib.getName pkg) [
            "blink-cmp-spell"
          ];
      };
      config = import ./config;

      nvim = nixvim.legacyPackages.${system}.makeNixvimWithModule {
        inherit pkgs;
        module = config;
      };
    in
    {
      packages.${system}.default = nvim;

      checks.${system}.default = nixvim.lib.${system}.check.mkTestDerivationFromNvim {
        inherit nvim;
        name = "A nixvim configuration";
      };

      devShells.${system}.default = pkgs.mkShellNoCC {
        shellHook = ''
          echo Welcome to a Neovim dev environment powered by Nixvim
          PS1="Nixvim: \\w \$ "
          alias vim='nvim'
        '';
        packages = [
          nvim
        ];
      };
    };
}
