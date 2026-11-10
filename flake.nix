{
  description = "Weekly prebuilt nix-index database for nixos-unstable";

  inputs = {
    index-x86_64-linux = {
      url = "https://github.com/JamDon2/nix-index-db/releases/download/2026-11-10/index-x86_64-linux";
      flake = false;
    };
    index-aarch64-linux = {
      url = "https://github.com/JamDon2/nix-index-db/releases/download/2026-11-10/index-aarch64-linux";
      flake = false;
    };
  };

  outputs =
    inputs:
    let
      db = system: {
        default = builtins.path {
          name = "nix-index-db";
          path = inputs."index-${system}";
        };
      };
    in
    {
      packages.x86_64-linux = db "x86_64-linux";
      packages.aarch64-linux = db "aarch64-linux";
    };
}
