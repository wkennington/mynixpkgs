{ mynixpkgs ? { outPath = ./.; revCount = 1234; shortRev = "abcdef"; }
, nixpkgs
, supportedSystems ? [ "x86_64-linux" "i686-linux" ]
, filterFunc
}:
with (import "${nixpkgs}/pkgs/top-level/release-lib.nix" { inherit supportedSystems; }).pkgs.lib;
filterAttrs filterFunc (import "${nixpkgs}/nixos/release.nix" { inherit nixpkgs supportedSystems; });
