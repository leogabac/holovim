local ok, err = pcall(vim.pack.add, {
  { src = "https://github.com/rebelot/kanagawa.nvim" },
  { src = "https://github.com/rcarriga/nvim-notify" },
  { src = "https://github.com/echasnovski/mini.statusline" },
  { src = "https://github.com/echasnovski/mini.starter" },
  { src = "https://github.com/echasnovski/mini.tabline" },
  { src = "https://github.com/echasnovski/mini.pick" },
  { src = "https://github.com/leogabac/novellum.nvim" },
  { src = "https://github.com/echasnovski/mini.extra" },
  { src = "https://github.com/echasnovski/mini.icons" },
  { src = "https://github.com/echasnovski/mini.pairs" },
  { src = "https://github.com/echasnovski/mini.sessions" },
  { src = "https://github.com/echasnovski/mini.surround" },
  { src = "https://github.com/L3MON4D3/LuaSnip" },
  { src = "https://github.com/bullets-vim/bullets.vim" },
  { src = "https://github.com/christoomey/vim-tmux-navigator" },
  { src = "https://github.com/lewis6991/gitsigns.nvim" },
  { src = "https://github.com/nvim-tree/nvim-tree.lua" },
  { src = "https://github.com/nvim-tree/nvim-web-devicons" },
  { src = "https://github.com/nvim-treesitter/nvim-treesitter", version = "main" },
  { src = "https://github.com/neovim/nvim-lspconfig" },
  { src = "https://github.com/Saghen/blink.cmp" },
  { src = "https://github.com/Saghen/blink.compat" },
  { src = "https://github.com/Saghen/blink.indent" },
  { src = "https://github.com/micangl/cmp-vimtex" },
  { src = "https://github.com/rafamadriz/friendly-snippets" },
  { src = "https://github.com/stevearc/conform.nvim" },
  { src = "https://github.com/tpope/vim-sleuth" },
  { src = "https://github.com/lervag/vimtex" },
}, { confirm = false, load = true })

if not ok then
  vim.schedule(function()
    vim.notify(err, vim.log.levels.WARN, { title = "vim.pack" })
  end)
end

require("plugins.colorscheme")
require("plugins.ui")
require("plugins.starter")
require("plugins.notify")
require("plugins.editing")
require("plugins.latex")
require("plugins.utilities")
require("plugins.files")
require("plugins.treesitter")
require("plugins.lsp")
require("plugins.completion")
require("plugins.indent")
require("plugins.novellum")
require("plugins.formatting")
