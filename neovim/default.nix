{
  config,
  pkgs,
  ...
}: {
  programs.neovim = {
    # extraLuaPackages = ps: [ps.magick];
    # extraPackages = [pkgs.imagemagick];
  };

  programs.nvf = {
    enable = true;

    settings.vim = {
      viAlias = false;
      vimAlias = true;

      lsp = {
        enable = true;
      };

      # Plugins :
      filetree.neo-tree.enable = true;
      telescope.enable = true;
      treesitter.enable = true;
      autopairs.nvim-autopairs.enable = true;
      comments.comment-nvim.enable = true;
      autocomplete.nvim-cmp.enable = true;
      snippets.luasnip.enable = true;
      dashboard.alpha.enable = true;
      git.gitsigns.enable = true;
      statusline.lualine.enable = true;
      ui.noice.enable = true;
      lsp.null-ls.enable = true;
      notes.todo-comments.enable = true;
      visuals.nvim-web-devicons.enable = true;
      mini.tabline.enable = true;

      # Options for plugins :
      dashboard.alpha.theme = "theta";
      statusline.lualine.setupOpts.options.theme = "base16";
      filetree.neo-tree.setupOpts = {
        window = {
          position = "left";
          width = 30;
        };
      };

      options = {
        tabstop = 2;
        shiftwidth = 2;
      };

      # Key mapping :

      # lsp.mappings.codeAction = "<leader>a";

      keymaps = [
        {
          key = "<leader>a";
          mode = ["n"];
          action = ":Lspsaga code_action<CR>";
        }
        {
          # Open Neotree
          key = "<C-n>";
          mode = ["i" "n" "x" "v"];
          silent = true;
          action = "<Esc>:Neotree<CR>";
        }
        {
          # Unfocus Neotree
          key = "<leader><Esc>";
          mode = ["n" "v"];
          silent = true;
          action = "<Esc>:Neotree filesystem close<CR><Esc>:Neotree filesystem show<CR>";
        }
        {
          # Cycle to next opened buffer
          key = "<A-Right>";
          mode = ["i" "n" "x" "v"];
          silent = false;
          action = "<Esc>:bnext<CR>";
        }
        {
          # Cycle to previous opened buffer
          key = "<A-Left>";
          mode = ["i" "n" "x" "v"];
          silent = false;
          action = "<Esc>:bprev<CR>";
        }
        {
          # Close current buffer
          key = "<C-Del>";
          mode = ["i" "n" "x" "v"];
          silent = false;
          action = "<Esc>:bd<CR><Esc>:bnext<CR>:Neotree filesystem close<CR>";
        }
      ];
    };
  };

  imports = [
    ./languages.nix
  ];
}
