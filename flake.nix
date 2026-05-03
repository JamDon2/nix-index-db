{
  description = "Weekly prebuilt nix-index database for nixos-unstable (x86_64-linux)";

  inputs = {
    db-file = {
      url = "https://github.com/JamDon2/nix-index-db/releases/download/2026-05-03/index-x86_64-linux";
      flake = false;
    };
  };

  outputs =
    { self, db-file }:
    {
      packages.x86_64-linux.default = builtins.path {
        name = "nix-index-db";
        path = db-file;
      };
    };
}
