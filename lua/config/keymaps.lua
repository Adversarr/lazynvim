-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

local success, which_key = pcall(require, "which-key")
if not success then
  return
end

local add = which_key.add

local function try_close_buffer(kill_command, bufnr, force)
  Snacks.bufdelete()
end

add({
  -- Buffer & Window
  { "<M-c>", try_close_buffer, desc = "Quit the window" },
  { "<M-q>", "<cmd>q<cr>", desc = "Quit the window" },
  { -- FZF
    { "<leader>t", group = "FZF" },
    { "<leader>tr", "<cmd>FzfLua resume<cr>", desc = "Resume last search" },
    { "<leader>tc", "<cmd>FzfLua commands<cr>", desc = "Neovim commands" },
    { "<leader>tF", "<cmd>FzfLua files<cr>", desc = "Find files" },
    { "<leader>tP", "<cmd>FzfLua oldfiles<cr>", desc = "Recent files" },
    { "<leader>tb", "<cmd>FzfLua buffers<cr>", desc = "Switch between buffers" },
    { "<leader>tp", "<cmd>FzfLua git_files<cr>", desc = "Git files" },
    { "<leader>tt", "<cmd>FzfLua live_grep<cr>", desc = "Live grep in workspace" },
    { "<leader>tw", "<cmd>FzfLua grep_cword<cr>", desc = "Grep word under cursor" },
    { "<leader>ty", "<cmd>FzfLua filetypes<cr>", desc = "File types" },
    -- FZF->git
    { "<leader>tg", group = "FZF git" },
    { "<leader>tgb", "<cmd>FzfLua git_branches<cr>", desc = "Git branches" },
    { "<leader>tgc", "<cmd>FzfLua git_commits<cr>", desc = "Git commits" },
    { "<leader>tgs", "<cmd>FzfLua git_status<cr>", desc = "Git status" },
    { "<leader>tgf", "<cmd>FzfLua git_diff<cr>", desc = "Git diff" },
    { "<leader>tgP", "<cmd>lua require('fzf-lua').git_files({cmd = 'git ls-files --exclude-standard --others'})<cr>", desc = "Git files (untracked)" },
    { "<leader>to", "<cmd>FzfLua lsp_document_symbols<cr>", desc = "Document symbols" },
    mode = { "n" },
  }
})
