return {
  {
    "Mofiqul/vscode.nvim",
    priority = 1000,
    config = function()
      vim.opt.termguicolors = true

      require("vscode").setup({
        transparent = false,
        italic_comments = true,
        italic_inlayhints = true,
        underline_links = true,
        disable_nvimtree_bg = true,
        terminal_colors = true,
      })
    end,
  },

  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "vscode",
    },
  },
}
