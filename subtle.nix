{ lib, stdenv, fetchhg, libX11, libXinerama, libXft, libXrandr, ruby, .. }:

stdenv.mkDerivation {
  pname = "subtle";
  version = "0.9999";
  src = fetchhg {
    url = "https://hg.unexist.dev/subtle";
    rev = "7881370e398a";
    hash = "cb2c4a304ff96e56b45416de44bf338e39cfacc9ec17a712a294334024f2ceb9f7fa25ab2aea336e2b3d2060ff989c6e23700a5ba123dbd14694a60099297174";
  };

  installFlags = [ "PREFIX=$(out)" ];

  system = builtins.currentSystem;
  buildInputs = [ libX11 libXinerama libXft ruby ];
}
