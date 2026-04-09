local ok, conform = pcall(require, "conform")
if not ok then
  return
end

conform.setup({
  notify_on_error = false,
  format_on_save = false,
  default_format_opts = {
    lsp_format = "fallback",
  },
  formatters_by_ft = {
    python = function(bufnr)
      if conform.get_formatter_info("ruff_format", bufnr).available then
        return { "ruff_format" }
      end

      return {}
    end,
  },
})

vim.keymap.set("n", "<leader>ff", function()
  conform.format({
    async = true,
    lsp_format = "fallback",
  })
end, { desc = "Format buffer", noremap = true, silent = true })
