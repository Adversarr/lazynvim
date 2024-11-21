-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

local success, which_key = pcall(require, "which-key")
if not success then
  return
end

local register = which_key.register
local add = which_key.add

local function try_close_buffer(kill_command, bufnr, force)
  Snacks.bufdelete()
end

-- Buffer & Window
add({
  { "<M-c>", try_close_buffer, desc = "Quit the window" },
  { "<M-q>", "<cmd>q<cr>", desc = "Quit the window" },
})
