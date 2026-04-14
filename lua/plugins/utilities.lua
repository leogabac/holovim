local ok_gitsigns, gitsigns = pcall(require, "gitsigns")
if ok_gitsigns then
  gitsigns.setup({})
end

local ok_sessions, mini_sessions = pcall(require, "mini.sessions")
if ok_sessions then
  mini_sessions.setup({})
end

vim.g.bullets_enabled_file_types = { "markdown", "text", "tex" }
