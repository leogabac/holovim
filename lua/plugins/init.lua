local ok, err = pcall(vim.pack.add, {
  { src = "https://github.com/rebelot/kanagawa.nvim" },
}, { confirm = false, load = true })

if not ok then
  vim.schedule(function()
    vim.notify(err, vim.log.levels.WARN, { title = "vim.pack" })
  end)
  return
end

require("plugins.colorscheme")
