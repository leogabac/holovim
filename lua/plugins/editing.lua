local ok_pairs, mini_pairs = pcall(require, "mini.pairs")
if not ok_pairs then
  mini_pairs = nil
end

if mini_pairs then
  mini_pairs.setup({})
end

local ok_surround, mini_surround = pcall(require, "mini.surround")
if not ok_surround then
  return
end

mini_surround.setup({
  custom_surroundings = {
    ["("] = { output = { left = "(", right = ")" } },
    ["["] = { output = { left = "[", right = "]" } },
    ["{"] = { output = { left = "{", right = "}" } },
    ["<"] = { output = { left = "<", right = ">" } },
    ['"'] = { output = { left = '"', right = '"' } },
    ["'"] = { output = { left = "'", right = "'" } },
    ["`"] = { output = { left = "`", right = "`" } },
    ["b"] = { output = { left = "**", right = "**" } },
  },
})
