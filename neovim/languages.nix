{ config, pkgs, ... }:

{
  programs.nvf.settings.vim.languages = {
    enableFormat = true;
    enableTreesitter = true;
    enableExtraDiagnostics = true;

    nix = {
      enable = true;
      lsp.enable = true;
    };
  };

  programs.nvf.settings.vim.lsp = {
    formatOnSave = true;
    lspkind.enable = false;
    lightbulb.enable = true;
    lspsaga.enable = false;
    trouble.enable = true;
  };
}
