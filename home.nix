{ pkgs, ... }:

with import <nixpkgs> {};
with builtins;
with lib;
with import <home-manager/modules/lib/dag.nix> { inherit lib; };

{
  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
  home.stateVersion = "20.09";

  programs {
    neovim = {
      enable = true;
      viAlias = true;
      vimAlias = true;

      settings = {
        number = true;
      };
      plugins = [
        "fugitive" "vim-gitgutter"
	"rust-vim"
      ];

      extraConfig = builtins.readFile vim/vimrc;
    };
  };
}
