vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

local ok_tree, nvim_tree = pcall(require, "nvim-tree")
if ok_tree then
  nvim_tree.setup({
    view = {
      width = 35,
      side = "left",
    },
    renderer = {
      highlight_git = true,
      indent_markers = {
        enable = true,
      },
      icons = {
        glyphs = {
          folder = {
            arrow_closed = "▶",
            arrow_open = "▼",
          },
        },
      },
    },
    filters = {
      dotfiles = false,
    },
    git = {
      enable = true,
      ignore = false,
    },
    actions = {
      open_file = {
        quit_on_open = true,
      },
    },
  })

  vim.keymap.set("n", "<leader>e", "<cmd>NvimTreeToggle<CR>", { desc = "Toggle file tree", silent = true })
end

local ok_pick, mini_pick = pcall(require, "mini.pick")
if not ok_pick then
  return
end

vim.ui.select = mini_pick.ui_select

mini_pick.setup({
  mappings = {
    caret_left = "<Left>",
    caret_right = "<Right>",
    choose = "<CR>",
    choose_in_split = "<C-s>",
    choose_in_tabpage = "<C-t>",
    choose_in_vsplit = "<C-v>",
    choose_marked = "<M-CR>",
    delete_char = "<BS>",
    delete_char_right = "<Del>",
    delete_left = "<C-u>",
    delete_word = "<C-w>",
    mark = "<C-x>",
    mark_all = "<C-a>",
    move_down = "<C-j>",
    move_start = "<C-g>",
    move_up = "<C-k>",
    paste = "<C-r>",
    refine = "<C-Space>",
    refine_marked = "<M-Space>",
    scroll_down = "<C-f>",
    scroll_left = "<C-h>",
    scroll_right = "<C-l>",
    scroll_up = "<C-b>",
    stop = "<Esc>",
    toggle_info = "<S-Tab>",
    toggle_preview = "<Tab>",
  },
  options = {
    content_from_bottom = true,
    use_cache = false,
  },
  window = {
    config = function()
      local height = math.floor(0.618 * vim.o.lines)
      local width = math.floor(0.618 * vim.o.columns)

      return {
        anchor = "NW",
        height = height,
        width = width,
        row = math.floor(0.5 * (vim.o.lines - height)),
        col = math.floor(0.5 * (vim.o.columns - width)),
      }
    end,
    prompt_caret = "▏",
    prompt_prefix = " ",
  },
})

local ok_extra, mini_extra = pcall(require, "mini.extra")
if ok_extra then
  mini_extra.setup()
end

vim.keymap.set("n", "<leader>sf", function()
  mini_pick.builtin.files()
end, { desc = "Search files", noremap = true, silent = true })

vim.keymap.set("n", "<leader>sw", function()
  mini_pick.builtin.grep_live(nil, {
    source = {
      name = "Live Grep (cwd)",
      cwd = vim.fn.getcwd(),
    },
  })
end, { desc = "Live grep", noremap = true, silent = true })
