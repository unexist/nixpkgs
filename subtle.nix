{ stdenv, fetchhg }:

stdenv.mkDerivation {
  pname = "subtle";
  version = "0.9999";
  src = fetchhg {
    url = "https://hg.unexist.dev/subtle";
    rev = "7881370e398a";
    hash = "7881370e398a";
  };

  installFlags = [ "PREFIX=$(out)" ];

  system = builtins.currentSystem;
  buildInputs = [ruby];
}
