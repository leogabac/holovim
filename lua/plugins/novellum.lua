local ok, novellum = pcall(require, "novellum")
if not ok then
  return
end

novellum.setup({
  ui = {
    notify = true,
  },
})
