{ stdenv, pkgs, fetchzip, fetchpatch, fetchgit, fetchurl }:
stdenv.mkDerivation {
  name = "ats-complexity";

  src = ./.;
  buildInputs = with pkgs;
  [ ats2
    which
  ];
}
