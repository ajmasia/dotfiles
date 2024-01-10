let
  statuscolum = builtins.readFile ./statuscolum.lua;
in
{
  programs.nixvim = {
    options = {
      termguicolors = true;
      hlsearch = true;
      incsearch = true;

      number = true;
      relativenumber = false;
      numberwidth = 2;
      swapfile = false;
      cursorline = true;
      ruler = false;
      showcmd = true;
      showmode = false;

      splitbelow = true;
      splitright = true;
      undofile = true;
      undolevels = 10000;

      signcolumn = "yes";
      cmdheight = 1;
      wildmenu = true;

      foldlevel = 99;
      foldlevelstart = 99;
      foldenable = true;

      # Tab options
      tabstop = 4;
      shiftwidth = 4;
      softtabstop = 0;
      expandtab = true;
      autoindent = true;

      updatetime = 100;
      timeout = true;
      timeoutlen = 300;
    };

    # define the style of the status colum on the left screen
    extraConfigLua = ''${statuscolum}'';
  };
}
