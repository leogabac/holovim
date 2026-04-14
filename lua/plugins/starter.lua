local ok, mini_starter = pcall(require, "mini.starter")
if not ok then
  return
end

local header = table.concat({
  " _           _            _              ,--./,-.",
  "| |__   ___ | | _____   _(_)_ __ ___    / #      \\\\",
  "| '_ \\ / _ \\| |/ _ \\ \\ / / | '_ ` _ \\  |          |",
  "| | | | (_) | | (_) \\ V /| | | | | | |  \\\\        /",
  "|_| |_|\\___/|_|\\___/ \\_/ |_|_| |_| |_|   `._,._.'",
  "",
  '"While one may lose much because of avarice,',
  'nothing as ever accomplished by abstinence"'
}, "\n")

local starter_items = {
  {
    name = "Files",
    action = function()
      require("mini.pick").builtin.files()
    end,
    section = "Search",
  },
  {
    name = "Grep",
    action = function()
      require("mini.pick").builtin.grep_live()
    end,
    section = "Search",
  },
  {
    name = "Explorer",
    action = function()
      vim.cmd("NvimTreeToggle")
    end,
    section = "Browse",
  },
  {
    name = "Session load",
    action = function()
      require("mini.sessions").select()
    end,
    section = "Sessions",
  },
  {
    name = "Session save",
    action = function()
      require("mini.sessions").write()
    end,
    section = "Sessions",
  },
}

mini_starter.setup({
  evaluate_single = true,
  header = header,
  items = starter_items,
  footer = "space leads the way",
  content_hooks = {
    mini_starter.gen_hook.adding_bullet(),
    mini_starter.gen_hook.aligning("center", "center"),
  },
})
