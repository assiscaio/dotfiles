direnv hook fish | source

# ALIASES
#
#Home manager
alias h="home-manager"
alias he="home-manager edit"
alias hs="home-manager switch"
alias hp="home-manager packages"
alias hgen="home-manager generations"

#NIX
alias ni="nix-env -i"
alias ne="nix-env -e"
alias ngen="nix-env --list-generations"
alias nis="nix-shell"
alias nrs="sudo nixos-rebuild switch"
alias nrb="sudo nixos-rebuild boot"

alias nso="sudo nix-store --optimize"

