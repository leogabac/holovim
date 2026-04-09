local ok_gitsigns, gitsigns = pcall(require, "gitsigns")
if ok_gitsigns then
  gitsigns.setup({})
end

vim.g.bullets_enabled_file_types = { "markdown", "text", "tex" }
