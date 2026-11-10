{
  description = "Weekly prebuilt nix-index database for nixos-unstable (x86_64-linux, aarch64-linux)";

  inputs = {
    db-file = {
      url = "https://github.com/JamDon2/nix-index-db/releases/download/2026-11-08/index-x86_64-linux";
      flake = false;
    };
  };

  outputs =
    { db-file, ... }@inputs:
    let
      db =
        file:
        builtins.path {
          name = "nix-index-db";
          path = file;
        };
    in
    {
      packages = {
        x86_64-linux.default = db db-file;
      }
      # the build workflow adds this input the first time it publishes the asset
      // (
        if inputs ? db-file-aarch64-linux then
          { aarch64-linux.default = db inputs.db-file-aarch64-linux; }
        else
          { }
      );
    };
}
