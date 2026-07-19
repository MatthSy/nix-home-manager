{
  config,
  pkgs,
  ...
}: {
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

      # Options for plugins :
      dashboard.alpha.theme = "theta";
      statusline.lualine.theme = "base16";

      options = {
        tabstop = 2;
        shiftwidth = 2;
      };

      # Key mapping :
      lsp.mappings.codeAction = "<leader>a";

      keymaps = [
        {
          key = "<C-n>";
          mode = ["n" "x" "v"];
          silent = true;
          action = ":Neotree<CR>";
        }
        {
          key = "<C-n>";
          mode = ["i"];
          silent = true;
          action = ":<Esc>Neotree<CR>";
        }
      ];
    };
  };

  imports = [
    ./languages.nix
  ];
}
