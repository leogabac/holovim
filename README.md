# holovim
A neovim configuration for proud, wise, wolves.

## Requirements

- Neovim 0.12 or newer
- `tmux` for tmux pane navigation
- `python-lsp-server`
- `gopls`
- `ruff` for Python linting and formatting
- `ltex-ls`
- `latexmk`
- `zathura`

For `gopls`, install Go first and then run:

```sh
go install golang.org/x/tools/gopls@latest
```

## Included Plugins

- [`leogabac/novellum.nvim`](https://github.com/leogabac/novellum.nvim) for Novellum workspace integration
- [`rcarriga/nvim-notify`](https://github.com/rcarriga/nvim-notify) for notifications, including Novellum rebuild status

## Novellum

This config enables `novellum.nvim` with notifications turned on.

Current Novellum keymaps:

- `<leader>nf` opens `:NovellumFind`
- `<leader>ns` opens `:NovellumSearch`
- `<leader>no` opens `:NovellumOpenNote`
- `<leader>nt` opens `:NovellumStitch`
- `<leader>nc` runs `:NovellumCompile`
- `<leader>np` runs `:NovellumOpen`
- `<leader>nr` runs `:NovellumRefresh`
- `<leader>nh` runs `:NovellumHealth`

Useful Novellum commands that may not be mapped yet:

- `:NovellumStitchCurrent` stitches the current note directly
- `:NovellumBuildNow` reruns the last recorded stitch and compiles it
- `:NovellumBuildStart` enables rebuild-on-save for the last recorded stitch
- `:NovellumBuildStop` disables rebuild-on-save
- `:NovellumBuildStatus` shows the current rebuild state

The current stitch workflow in `novellum.nvim` is:

1. Use `:NovellumStitchCurrent` for the fastest single-note path, or `:NovellumStitch` for the interactive selector.
2. In the interactive selector, the first options are current note, last selection, pick notes, all notes, and by category.
3. In the `mini.pick` stitch picker, `<C-b>` marks notes and `<M-CR>` stitches the marked set.
4. If `nvim-notify` is available, rebuild notifications only stay visible while a rebuild is running or queued.
