{ stdenv, lib, fetchhg, pkg-config, libX11, libXi, libXinerama, libXrandr, libXft, libXpm, libXtst, xinput, ruby }:

stdenv.mkDerivation {
  pname = "subtle";
  version = "0.9999";

  meta = with lib; {
    description = "A grid-based manual tiling window manager";
    homepage    = "https://subtle.de";
    license     = licenses.gpl3;
    platforms   = platforms.linux;
    #maintainers = [ maintainers.unexist ];
  };

  src = fetchhg {
    url = "https://hg.unexist.dev/subtle";
    rev = "864ce3a9bc6b";
    sha256 = "0085csjvjqzqj673gzj25nfhljynn0pidsr171ga18x6d59br0w5"; # Created with nix-prefetch-hg
  };

  system = builtins.currentSystem;
 
  buildInputs = [
    libX11
    libXi
    libXinerama
    libXrandr
    libXft
    libXpm
    libXtst
    xinput
    ruby
  ];

  nativeBuildInputs = [ pkg-config ];

  outputs = [ "out" ];

  buildPhase = ''
    rake prefix=${placeholder "out"} sysconfdir=${placeholder "out"}/etc
  '';

  installPhase = ''
    rake install
  '';
}
