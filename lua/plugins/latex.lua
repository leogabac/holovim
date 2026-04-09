vim.g.vimtex_view_method = "zathura"
vim.g.vimtex_compiler_method = "latexmk"

vim.keymap.set("n", "<leader>ll", "<cmd>VimtexCompile<CR>", {
  desc = "Vimtex compile",
  noremap = true,
  silent = true,
})

vim.keymap.set("n", "<leader>lc", "<cmd>VimtexClean<CR>", {
  desc = "Vimtex clean",
  noremap = true,
  silent = true,
})

local ok_luasnip, luasnip = pcall(require, "luasnip")
if not ok_luasnip then
  return
end

require("luasnip.loaders.from_vscode").lazy_load()
require("luasnip.loaders.from_lua").load({
  paths = { vim.fn.stdpath("config") .. "/lua/snippets" },
})

luasnip.config.setup({
  update_events = "TextChanged,TextChangedI",
  enable_autosnippets = true,
})
