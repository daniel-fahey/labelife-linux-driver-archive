{
  description = "Labelife Linux printer driver archive";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";
  };

  outputs = { nixpkgs, ... }:
    let
      system = "x86_64-linux";
      pkgs = nixpkgs.legacyPackages.${system};
    in
    {
      devShells.${system}.default = pkgs.mkShellNoCC {
        packages = with pkgs; [
          bash
          coreutils
          curl
          gawk
          git
          gnutar
          unzip
          internetarchive
        ];
      };
    };
}
