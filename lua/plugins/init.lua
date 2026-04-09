local ok, err = pcall(vim.pack.add, {
  { src = "https://github.com/rebelot/kanagawa.nvim" },
  { src = "https://github.com/echasnovski/mini.statusline" },
  { src = "https://github.com/echasnovski/mini.tabline" },
  { src = "https://github.com/echasnovski/mini.pick" },
  { src = "https://github.com/echasnovski/mini.icons" },
  { src = "https://github.com/nvim-tree/nvim-tree.lua" },
  { src = "https://github.com/nvim-tree/nvim-web-devicons" },
}, { confirm = false, load = true })

if not ok then
  vim.schedule(function()
    vim.notify(err, vim.log.levels.WARN, { title = "vim.pack" })
  end)
  return
end

require("plugins.colorscheme")
require("plugins.ui")
require("plugins.files")
