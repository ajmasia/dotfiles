{ pkgs, ... }: {

  imports = [
    ./config
    ./plugins
  ];

  programs.nixvim = {
    enable = true;

    defaultEditor = true;

    # feature that enhances the way Neovim loads and executes Lua modules, offering improved performance and flexibility.
    luaLoader.enable = true;

    extraPlugins = with pkgs.vimPlugins; [ plenary-nvim ];
  };

}
