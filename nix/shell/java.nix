with import <nixpkgs> {};

stdenv.mkDerivation {
    name = "java";
    shellHook = ''
        export JAVA_HOME="$HOME/opt/java/jdk1.8.0_311"
        export PATH="$JAVA_HOME/bin/:$PATH"
    '';
}