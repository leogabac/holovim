local ok, blink = pcall(require, "blink.cmp")
if not ok then
  return
end

blink.setup({
  keymap = {
    preset = "default",
    ["<CR>"] = { "accept", "fallback" },
    ["<C-l>"] = { "snippet_forward", "fallback" },
    ["<C-h>"] = { "snippet_backward", "fallback" },
  },
  appearance = {
    nerd_font_variant = "mono",
  },
  snippets = {
    preset = "luasnip",
  },
  completion = {
    documentation = {
      auto_show = false,
    },
  },
  sources = {
    default = { "lsp", "path", "snippets", "buffer" },
  },
  fuzzy = {
    implementation = "lua",
  },
})
