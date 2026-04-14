local ok, blink_indent = pcall(require, "blink.indent")
if not ok then
  return
end

blink_indent.setup({})
