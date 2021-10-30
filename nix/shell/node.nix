with import <nixpkgs> {};

let 
    unstable = import <nixos-unstable> {};
in
stdenv.mkDerivation {
    name = "node";
    buildInputs = [
        nodejs
        unstable.yarn
    ];
    shellHook = ''
        export PATH="$PWD/node_modules/.bin/:$HOME/.yarn/bin/:$PATH"
    '';
}