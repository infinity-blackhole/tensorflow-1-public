{ pkgs ? import <nixpkgs> { }, lib ? pkgs.lib, stdenv ? pkgs.stdenv }:

pkgs.mkShell {
  buildInputs = [
    (pkgs.python37.withPackages (pypkgs: with pypkgs; [ pip poetry ]))
    pkgs.bashInteractive
  ];
  shellHook = ''
    poetry shell
  '';
  LD_LIBRARY_PATH = lib.makeLibraryPath [ stdenv.cc.cc.lib ];
}
