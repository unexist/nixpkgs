{ stdenv, lib, fetchhg, pkg-config, libX11, libXinerama, libXrandr, libXft, ruby }:

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
    rev = "7881370e398a";
    sha256 = "03r0hyb74ppczw9a8w3l1g0ipj6zv0gf0hsm9bva7a8znywg8v5q"; # Created with nix-prefetch-hg
  };

  system = builtins.currentSystem;
 
  buildInputs = [
    libX11
    libXinerama
    libXrandr
    libXft
    ruby
  ];

  nativeBuildInputs = [ pkg-config ];

  outputs = [
    "out"
    "man"
  ];

  buildPhase = ''
    rake prefix=${placeholder "out"} mandir=${placeholder "man"}
  '';
}
