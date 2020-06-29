## Setup
$ git clone ssh://git@github.com/jlynn/nix-home

$ cd nix-home

$ ln -s $(pwd) $HOME/.config/nixpkgs

$ nix-env -f '<nixpkgs>'-iA home-manager

$ home-manager switch
