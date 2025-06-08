-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here
-- LSP Server to use for Python.

-- LazyVim auto format
vim.g.autoformat = false

-- if the completion engine supports the AI source,
-- use that instead of inline suggestions
vim.g.ai_cmp = true
vim.g.copilot_proxy = "https://localhost:7890"

-- Set to "basedpyright" to use basedpyright instead of pyright.
vim.g.lazyvim_python_lsp = "basedpyright"
-- Set to "ruff_lsp" to use the old LSP implementation version.
vim.g.lazyvim_python_ruff = "ruff"
vim.g.snacks_animate = false
-- vim.g.lazyvim_cmp = "nvim-cmp"

-- local opt = vim.opt
-- if vim.fn.has("nvim-0.10") == 1 then
--  opt.smoothscroll = false
-- end

vim.g.lazyvim_picker = "telescope"

---- Set to `false` to prevent "non-lsp snippets"" from appearing inside completion windows
-- Motivation: Less clutter in completion windows and a more direct usage of snippits
vim.g.lazyvim_mini_snippets_in_completion = true

-- The prebuilt version crashes.
vim.g.lazyvim_blink_main = true
