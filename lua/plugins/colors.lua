local ok, colorizer = pcall(require, "colorizer")
if not ok then
  return
end

colorizer.setup({
  filetypes = { "*" },
  user_default_options = {
    RGB = true,
    RRGGBB = true,
    names = false,
    RRGGBBAA = true,
    AARRGGBB = true,
    mode = "background",
    tailwind = false,
  },
})
