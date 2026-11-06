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

local ok_icons, mini_icons = pcall(require, "mini.icons")
if ok_icons then
  mini_icons.setup()
end

local function shorten_path(path)
  local sep = package.config:sub(1, 1)
  local parts = vim.split(path, sep, { plain = true, trimempty = true })

  if #parts <= 4 then
    return path
  end

  return table.concat({ parts[1], "…", parts[#parts - 1], parts[#parts] }, sep)
end

mini_statusline.setup({
  content = {
    active = function()
      local mode, mode_hl = mini_statusline.section_mode({ trunc_width = 120 })
      local git = mini_statusline.section_git({ trunc_width = 40 })
      local location = string.format("%d | %d", unpack(vim.api.nvim_win_get_cursor(0)))
      local path = vim.api.nvim_buf_get_name(0)
      local filename = function()
        local display = path ~= "" and vim.fn.fnamemodify(path, ":~:.") or "[No Name]"
        local ft = vim.bo.filetype ~= "" and vim.bo.filetype or "txt"
        local icon = ""

        if ok_icons then
          local ok_icon, file_icon = pcall(mini_icons.get, "filetype", ft)
          if ok_icon and file_icon ~= nil and file_icon ~= "" then
            icon = file_icon .. " "
          end
        end

        if path ~= "" then
          display = shorten_path(display)
        end

        return string.format("%s%s", icon, display)
      end

      local file_size = function()
        if path == "" then
          return "0 B"
        end

        local stat = vim.loop.fs_stat(path)
        if not stat or not stat.size then
          return "0 B"
        end

        local size = stat.size
        local units = { "B", "KB", "MB", "GB", "TB" }
        local unit = 1
        while size >= 1024 and unit < #units do
          size = size / 1024
          unit = unit + 1
        end

        if unit == 1 then
          return string.format("%d %s", size, units[unit])
        end

        return string.format("%.1f %s", size, units[unit])
      end

      local language = function()
        local ft = vim.bo.filetype ~= "" and vim.bo.filetype or "no ft"

        if ft == "no ft" then
          return ft
        end

        if ok_icons then
          local icon = mini_icons.get("filetype", ft)
          if icon ~= nil and icon ~= "" then
            return string.format("%s %s", icon, ft)
          end
        end

        return ft
      end

      return mini_statusline.combine_groups({
        { hl = mode_hl, strings = { mode } },
        { hl = "MiniStatuslineDevinfo", strings = { git } },
        "%<",
        { hl = "MiniStatuslineFilename", strings = { filename() } },
        "%=",
        { hl = "MiniStatuslineFileinfo", strings = { file_size() } },
        { hl = "MiniStatuslineLocation", strings = { location } },
        { hl = mode_hl, strings = { language() } },
      })
    end,
    inactive = nil,
  },
  use_icons = false,
  set_vim_settings = true,
})
