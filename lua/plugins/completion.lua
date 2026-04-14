local ok, blink = pcall(require, "blink.cmp")
if not ok then
  return
end

local ok_compat, blink_compat = pcall(require, "blink.compat")
if ok_compat then
  blink_compat.setup({})
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
  signature = {
    enabled = true,
    trigger = {
      enabled = true,
      show_on_trigger_character = true,
      show_on_insert = false,
      show_on_insert_on_trigger_character = true,
    },
    window = {
      border = "single",
      show_documentation = false,
    },
  },
  sources = {
    default = { "lsp", "path", "snippets", "buffer" },
    per_filetype = {
      tex = { "lsp", "path", "snippets", "buffer", "vimtex" },
    },
    providers = {
      vimtex = {
        name = "vimtex",
        module = "blink.compat.source",
      },
    },
  },
  fuzzy = {
    implementation = "lua",
  },
})
