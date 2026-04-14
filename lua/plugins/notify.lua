local ok, notify = pcall(require, "notify")
if not ok then
  return
end

notify.setup({
  background_colour = "#1f1f28",
  fps = 60,
  level = vim.log.levels.INFO,
  minimum_width = 24,
  render = "wrapped-compact",
  stages = "fade_in_slide_out",
  timeout = 2500,
  top_down = false,
})

vim.notify = notify
