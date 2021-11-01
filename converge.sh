NIXOS_ETC_DEST_DIR=$HOME/src/dotfiles/nix/etc
NIX_HOME_DEST_DIR=$HOME/src/dotfiles/nix/home/
FISH_HOME_DEST_DIR=$HOME/src/dotfiles/fish

mkdir -p $NIXOS_ETC_DEST_DIR
mkdir -p $NIX_HOME_DEST_DIR
mkdir -p $FISH_HOME_DEST_DIR

echo "Arquivo configuration.nix deve ser copiado para a pasta /etc/nixos" > $NIXOS_ETC_DEST_DIR/readme.txt
echo "Obtendo configuration.nix"
cp -v /etc/nixos/configuration.nix $NIXOS_ETC_DEST_DIR/

echo "Arquivos home.nix e config.nix devem ser copiados para a pasta $HOME/.config/nixpkgs" > $NIX_HOME_DEST_DIR/readme.txt
echo "Arquivo nix.conf deve ser copiado para a pasta $HOME/.config/nix" >> $NIX_HOME_DEST_DIR/readme.txt
echo "Obtendo home.nix"
cp -v $HOME/.config/nixpkgs/home.nix $NIX_HOME_DEST_DIR

echo "Obtendo config.nix"
cp -v $HOME/.config/nixpkgs/config.nix $NIX_HOME_DEST_DIR

echo "Obtendo nix.conf"
cp -v $HOME/.config/nix/nix.conf $NIX_HOME_DEST_DIR/

echo "Arquivo config.fish deve ser copiado para a pasta $HOME/.config/fish" > $FISH_HOME_DEST_DIR/readme.txt
echo "Obtendo fish.configs"
cp -v $HOME/.config/fish/config.fish $FISH_HOME_DEST_DIR
