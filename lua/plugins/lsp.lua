vim.diagnostic.config({
  severity_sort = true,
  float = { border = "rounded", source = "if_many" },
  underline = { severity = vim.diagnostic.severity.ERROR },
  virtual_text = {
    source = "if_many",
    spacing = 2,
  },
})

vim.api.nvim_create_autocmd("LspAttach", {
  group = vim.api.nvim_create_augroup("holovim_lsp_attach", { clear = true }),
  callback = function(event)
    local ok_extra, mini_extra = pcall(require, "mini.extra")

    local map = function(lhs, rhs, desc, mode)
      vim.keymap.set(mode or "n", lhs, rhs, {
        buffer = event.buf,
        desc = desc,
        silent = true,
      })
    end

    local pick_lsp = function(scope, fallback, extra_opts)
      return function()
        if ok_extra then
          mini_extra.pickers.lsp(vim.tbl_extend("force", { scope = scope }, extra_opts or {}))
          return
        end

        fallback()
      end
    end

    local pick_diagnostic = function()
      if ok_extra then
        mini_extra.pickers.diagnostic({ scope = "current" })
        return
      end

      vim.diagnostic.setloclist({ open = true })
    end

    map("gd", pick_lsp("definition", vim.lsp.buf.definition), "Goto definition")
    map("gr", pick_lsp("references", vim.lsp.buf.references), "Goto references")
    map("gI", pick_lsp("implementation", vim.lsp.buf.implementation), "Goto implementation")
    map("grn", vim.lsp.buf.rename, "Rename symbol")
    map("gra", vim.lsp.buf.code_action, "Code action", { "n", "x" })
    map("K", vim.lsp.buf.hover, "Hover")
    map("gD", vim.lsp.buf.declaration, "Goto declaration")
    map("<leader>D", pick_lsp("type_definition", vim.lsp.buf.type_definition), "Type definition")
    map("<leader>ds", pick_lsp("document_symbol", vim.lsp.buf.document_symbol), "Document symbols")
    map("<leader>ws", pick_lsp("workspace_symbol", vim.lsp.buf.workspace_symbol), "Workspace symbols")
    map("<leader>sd", vim.diagnostic.open_float, "Show diagnostics")
    map("<leader>ld", pick_diagnostic, "List diagnostics")

    local client = vim.lsp.get_client_by_id(event.data.client_id)
    if not client then
      return
    end

    if client:supports_method(vim.lsp.protocol.Methods.textDocument_documentHighlight, event.buf) then
      local highlight_group = vim.api.nvim_create_augroup("holovim_lsp_highlight", { clear = false })

      vim.api.nvim_create_autocmd({ "CursorHold", "CursorHoldI" }, {
        buffer = event.buf,
        group = highlight_group,
        callback = vim.lsp.buf.document_highlight,
      })

      vim.api.nvim_create_autocmd({ "CursorMoved", "CursorMovedI" }, {
        buffer = event.buf,
        group = highlight_group,
        callback = vim.lsp.buf.clear_references,
      })

      vim.api.nvim_create_autocmd("LspDetach", {
        group = vim.api.nvim_create_augroup("holovim_lsp_detach", { clear = true }),
        callback = function(detach_event)
          vim.lsp.buf.clear_references()
          vim.api.nvim_clear_autocmds({ group = "holovim_lsp_highlight", buffer = detach_event.buf })
        end,
      })
    end

    if client:supports_method(vim.lsp.protocol.Methods.textDocument_inlayHint, event.buf) then
      map("<leader>th", function()
        vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled({ bufnr = event.buf }), { bufnr = event.buf })
      end, "Toggle inlay hints")
    end
  end,
})

vim.lsp.config("lua_ls", {
  settings = {
    Lua = {
      completion = {
        callSnippet = "Replace",
      },
      runtime = {
        version = "LuaJIT",
      },
      workspace = {
        checkThirdParty = false,
        library = vim.api.nvim_get_runtime_file("", true),
      },
      diagnostics = {
        disable = { "missing-fields" },
      },
      format = {
        enable = false,
      },
    },
  },
})

vim.lsp.config("pylsp", {
  settings = {
    pylsp = {
      plugins = {
        autopep8 = { enabled = false },
        flake8 = { enabled = false },
        mccabe = { enabled = false },
        pycodestyle = {
          enabled = true,
          maxLineLength = 120,
          ignore = { "E402", "E731", "W503" },
        },
        pydocstyle = { enabled = false },
        pyflakes = { enabled = false },
        pylint = { enabled = false },
        pylsp_black = { enabled = false },
        pylsp_isort = { enabled = false },
        pylsp_mypy = { enabled = false },
        rope_autoimport = { enabled = false },
        rope_completion = { enabled = false },
        yapf = { enabled = false },
      },
    },
  },
})

vim.lsp.enable({
  "lua_ls",
  "pylsp",
  "ruff",
})
