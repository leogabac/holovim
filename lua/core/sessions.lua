local session_dir = vim.fn.stdpath("state") .. "/sessions"
local group = vim.api.nvim_create_augroup("holovim_sessions", { clear = true })

vim.o.sessionoptions = "buffers,curdir,folds,help,tabpages,winsize,terminal"

local function session_file()
  local cwd = vim.loop.cwd() or vim.fn.getcwd()
  return session_dir .. "/" .. vim.fn.sha256(cwd) .. ".vim"
end

local function ensure_session_dir()
  if vim.fn.isdirectory(session_dir) == 0 then
    vim.fn.mkdir(session_dir, "p")
  end
end

local function load_session()
  if vim.fn.argc() > 0 then
    return
  end

  local file = session_file()
  if vim.uv.fs_stat(file) == nil then
    return
  end

  vim.cmd("silent! source " .. vim.fn.fnameescape(file))
end

local function save_session()
  ensure_session_dir()
  vim.cmd("silent! mksession! " .. vim.fn.fnameescape(session_file()))
end

vim.api.nvim_create_autocmd("VimEnter", {
  group = group,
  callback = function()
    vim.schedule(load_session)
  end,
})

vim.api.nvim_create_autocmd("VimLeavePre", {
  group = group,
  callback = save_session,
})
