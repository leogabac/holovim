local ok_tabline, mini_tabline = pcall(require, "mini.tabline")
if ok_tabline then
  mini_tabline.setup({
    tabpage_section = "left",
    show_icons = true,
    tab_first = true,
    name_formatter = function(buf_id)
      local name = vim.fn.fnamemodify(vim.api.nvim_buf_get_name(buf_id), ":t")
      if name == "" then
        return "[No Name]"
      end
      return name
    end,
    tab_highlight = "TabLineSel",
    win_highlight = "TabLine",
    truncate = true,
    truncate_len = 20,
  })
end

local ok_statusline, mini_statusline = pcall(require, "mini.statusline")
if not ok_statusline then
  return
end

mini_statusline.setup({
  content = {
    active = function()
      local mode, mode_hl = mini_statusline.section_mode({ trunc_width = 120 })
      local git = mini_statusline.section_git({ trunc_width = 40 })
      local filename = mini_statusline.section_filename({ trunc_width = 140 })
      local location = string.format("%d | %d", unpack(vim.api.nvim_win_get_cursor(0)))
      local time = vim.fn.strftime("%H:%M")

      local fileinfo = function()
        local ft = vim.bo.filetype ~= "" and vim.bo.filetype or "no ft"
        local enc = (vim.bo.fileencoding ~= "" and vim.bo.fileencoding ~= "utf-8")
            and string.format("[%s]", vim.bo.fileencoding)
          or ""
        return string.format("%s%s", ft, enc)
      end

      return mini_statusline.combine_groups({
        { hl = mode_hl, strings = { mode } },
        { hl = "MiniStatuslineDevinfo", strings = { git } },
        "%<",
        { hl = "MiniStatuslineFilename", strings = { filename } },
        "%=",
        { hl = "MiniStatuslineFileinfo", strings = { fileinfo() } },
        { hl = "MiniStatuslineLocation", strings = { location } },
        { hl = mode_hl, strings = { time } },
      })
    end,
    inactive = nil,
  },
  use_icons = false,
  set_vim_settings = true,
})
