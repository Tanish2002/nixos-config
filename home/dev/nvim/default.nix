{ pkgs, ... }: {
  programs.nixvim = {
    enable = true;
    #colorschemes.gruvbox.enable = true;
    colorschemes.onedark.enable = true;
    plugins = {
      barbar = {
        enable = true;
        animations = true;
      };
      #lightline.enable = true;
      comment-nvim.enable = true;
      coq-nvim = {
        enable = true;
        installArtifacts = true;
      };
      lsp = {
        enable = true;
        enabledServers = [ "gopls" ];
        servers = {
          rnix-lsp.enable = true;
          rust-analyzer.enable = true;
        };
      };
      lspsaga = {
        enable = true;
        icons = {
          codeAction = "";

        };
        signs = {
          error = "";
          hint = "";
          info = "";
          warning = "";
        };
      };
      lualine.enable = true;
      nvim-autopairs.enable = true;
      nvim-tree.enable = true;
      startify.enable = true;
      telescope.enable = true;
      treesitter.enable = true;
    };
    extraPlugins = with pkgs.vimPlugins; [
      vim-nix
      vim-go
    ];
    extraPackages = with pkgs; [ gcc gopls python39Packages.python-lsp-server ];
    globals.mapleader = " "; # Sets the leader key to comma
    maps = {
      # Async LSP Finder
      normal."<leader>gh" = {
        silent = true;
        action = ":Lspsaga lsp_finder<CR>";
      };
      # Code Action
      normal."<leader>ca" = {
        silent = true;
        action = ":Lspsaga code_action<CR>";
      };
      visual."<leader>ca" = {
        silent = true;
        action = ":<C-U>Lspsaga range_code_action<CR>";
      };
      # Rename
      normal."<leader>cr" = {
        action = ":Lspsaga rename<CR>";
      };
      # View Definations
      normal."<leader>gd" = {
        action = ":Lspsaga preview_definition<CR>";
      };
    };
    options = {
      number = true; # Show line numbers
      relativenumber = true; # Show relative line numbers
    };
  };
}
