local ok, treesitter = pcall(require, "nvim-treesitter")
if not ok then
  return
end

local languages = {
  "bash",
  "c",
  "lua",
  "markdown",
  "markdown_inline",
  "python",
  "query",
  "vim",
  "vimdoc",
}

treesitter.setup({
  install_dir = vim.fn.stdpath("data") .. "/site",
})

treesitter.install(languages)

vim.api.nvim_create_autocmd("FileType", {
  group = vim.api.nvim_create_augroup("holovim_treesitter", { clear = true }),
  callback = function(event)
    local disabled = {
      c = true,
      cpp = true,
      latex = true,
    }

    local filetype = vim.bo[event.buf].filetype
    if disabled[filetype] or filetype == "" then
      return
    end

    pcall(vim.treesitter.start, event.buf)
  end,
})
