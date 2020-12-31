{
  description = "A launcher application for the reMarkable tablet";
  inputs.nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";
  inputs.nix-inclusive.url = "github:input-output-hk/nix-inclusive";

  outputs = { self, nixpkgs, nix-inclusive }: {

    packages.x86_64-linux.oxide = (import nixpkgs {system = "x86_64-linux";}).callPackage ./oxide.nix { inherit (nix-inclusive.lib) inclusive; };

    defaultPackage.x86_64-linux = self.packages.x86_64-linux.oxide;

  };
}
