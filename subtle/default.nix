{ stdenv, lib, fetchhg, libX11, libXinerama, libXft, libXrandr, ruby }:

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
    sha256 = "03r0hyb74ppczw9a8w3l1g0ipj6zv0gf0hsm9bva7a8znywg8v5q";
  };

  installFlags = [ "PREFIX=$(out)" ];

  system = builtins.currentSystem;
  buildInputs = [ libX11 libXinerama libXft ruby ];
}
