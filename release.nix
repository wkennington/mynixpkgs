{ mynixpkgs ? { outPath = ./.; revCount = 1234; shortRev = "abcdef"; }
, nixpkgs
, packages
, supportedSystems ? [ "x86_64-linux" "i686-linux" "x86_64-darwin" ]
}:
with import "${nixpkgs}/pkgs/top-level/release-lib.nix" { inherit supportedSystems; };
mapTestOn (map (pkgs.lib.flip pkgs.lib.nameValuePair all) packages)
