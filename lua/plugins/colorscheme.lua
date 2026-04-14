local ok, kanagawa = pcall(require, "kanagawa")
if not ok then
  return
end

local function clear_background()
  local groups = {
    "Normal",
    "NormalFloat",
    "NormalNC",
    "SignColumn",
    "LineNr",
    "EndOfBuffer",
    "DiffAdd",
    "DiffChange",
    "DiffDelete",
    "GitGutterAdd",
    "GitGutterChange",
    "GitGutterDelete",
    "GitSignsAdd",
    "GitSignsChange",
    "GitSignsDelete",
    "TreesitterContext",
    "TreesitterContextLineNumber",
    "TreesitterContextLineNumberSeparator",
  }

  for _, group in ipairs(groups) do
    vim.api.nvim_set_hl(0, group, { bg = "NONE" })
  end

  vim.api.nvim_set_hl(0, "TreesitterContextSeparator", { fg = "#7AA2F7", bg = "NONE" })
  vim.api.nvim_set_hl(0, "LineNr", { fg = "#DCA561", bg = "NONE" })
  vim.api.nvim_set_hl(0, "CursorLineNr", { fg = "#FFD75F", bg = "NONE", bold = true })
end

kanagawa.setup({
  compile = false,
  undercurl = true,
  commentStyle = { italic = true },
  keywordStyle = { italic = true },
  statementStyle = { bold = true },
  transparent = true,
  dimInactive = false,
  terminalColors = true,
  colors = {
    palette = {},
    theme = { wave = {}, lotus = {}, dragon = {}, all = {} },
  },
  overrides = function()
    return {
      Normal = { bg = "NONE" },
      NormalFloat = { bg = "NONE" },
      NormalNC = { bg = "NONE" },
      SignColumn = { bg = "NONE" },
      LineNr = { fg = "#DCA561", bg = "NONE" },
      CursorLineNr = { fg = "#FFD75F", bg = "NONE", bold = true },
      EndOfBuffer = { bg = "NONE" },
      GitGutterAdd = { bg = "NONE" },
      GitGutterChange = { bg = "NONE" },
      GitGutterDelete = { bg = "NONE" },
      GitSignsAdd = { bg = "NONE" },
      GitSignsChange = { bg = "NONE" },
      GitSignsDelete = { bg = "NONE" },
      DiffAdd = { bg = "NONE" },
      DiffChange = { bg = "NONE" },
      DiffDelete = { bg = "NONE" },
    }
  end,
  theme = "wave",
  background = {
    dark = "wave",
    light = "lotus",
  },
})

vim.cmd.colorscheme("kanagawa")
clear_background()

vim.api.nvim_create_autocmd("ColorScheme", {
  group = vim.api.nvim_create_augroup("holovim_colorscheme", { clear = true }),
  callback = clear_background,
})
