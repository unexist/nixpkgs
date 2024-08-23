build:
	nix-build -E 'with import <nixpkgs> {}; callPackage ./subtle/default.nix {}'
