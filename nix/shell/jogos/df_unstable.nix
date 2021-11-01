with import <nixpkgs> {};
let
    packageOverrides = pkgs: {
        dwarf-fortress-full = pkgs.dwarf-fortress-full.override { enableSound = false ; enableIntro = false; };
    };
    unstable = import <nixos-unstable> { config = packageOverrides; };
    
in
    stdenv.mkDerivation {
        name = "df";
        buildInputs = [
            unstable.dwarf-fortress
        ];
        shellHook = ''
            echo "Dwarf Fortress versão 0.47.05!"
            echo Inicie executando dwarf-fortress
        '';
        # unstable.dwarf-fortress-packages.dwarf-fortress-full.override = {
        #     enableSound = false;
        #     enableIntro = false;
        # };
    }