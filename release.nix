{ mynixpkgs ? { outPath = ./.; revCount = 1234; shortRev = "abcdef"; }
, nixpkgs
, packages
, supportedSystems ? [ "x86_64-linux" "i686-linux" "x86_64-darwin" ]
}:
with import "${nixpkgs}/pkgs/top-level/release-lib.nix" { inherit supportedSystems; };
with pkgs.lib;
mapTestOn (listToAttrs (map (flip nameValuePair linux) packages))
