{ config, pkgs, ... }:

{
  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;

  # Home Manager needs a bit of information about you and the
  # paths it should manage.
  home.username = "john";
  home.homeDirectory = "/home/john";

  # This value determines the Home Manager release that your
  # configuration is compatible with. This helps avoid breakage
  # when a new Home Manager release introduces backwards
  # incompatible changes.
  #
  # You can update Home Manager without changing this value. See
  # the Home Manager release notes for a list of state version
  # changes in each release.
  home.stateVersion = "20.09";

  home.packages = [
    pkgs.htop
  ];

  programs = {
    git = {
      package = pkgs.gitAndTools.gitFull;
      enable = true;
      userName = "John Lynn";
      userEmail = "john@johnlynn.net";
    };

    neovim = {
      enable = true;
      viAlias = true;
      vimAlias = true;

      extraConfig = builtins.readFile vim/vimrc;

      plugins = [
        pkgs.vimPlugins.fugitive
	pkgs.vimPlugins.solarized
	pkgs.vimPlugins.command_T
	pkgs.vimPlugins.gitgutter
      ];
    };
  };
}
