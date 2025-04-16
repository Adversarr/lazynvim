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

add({
  -- Buffer & Window
  { "<M-c>", try_close_buffer, desc = "Quit the window" },
  { "<M-q>", "<cmd>q<cr>", desc = "Quit the window" },
  { -- Telescope
    { "<leader>t", group = "Telescope" },
    { "<leader>tr", "<cmd>Telescope resume<cr>", desc = "Resume" },
    { "<leader>tc", "<cmd>Telescope commands<cr>", desc = "Commands" },
    { "<leader>tF", "<cmd>Telescope find_files<cr>", desc = "Find files" },
    { "<leader>tP", "<cmd>Telescope find_files find_command=rg,--hidden,--files<cr>", desc = "Files" },
    { "<leader>tb", "<cmd>Telescope buffers<cr>", desc = "Switch between buffers" },
    { "<leader>tp", "<cmd>Telescope git_files show_untracked=true<cr>", desc = "Git Files." },
    { "<leader>tt", "<cmd>Telescope live_grep use_regex=true<cr>", desc = "Find string in ws" },
    { "<leader>tw", "<cmd>Telescope grep_string<cr>", desc = "Find string in ws" },
    { "<leader>ty", "<cmd>Telescope filetypes<cr>", desc = "File types" },
    -- Telescope->git
    { "<leader>tg", group = "Telescope git" },
    { "<leader>tgb", "<cmd>Telescope git_branches<cr>", desc = "Git Branches" },
    { "<leader>tgc", "<cmd>Telescope git_commits<cr>", desc = "Git Commits" },
    { "<leader>tgs", "<cmd>Telescope git_status<cr>", desc = "Git Status" },
    { "<leader>tgf", "<cmd>Telescope git_files<cr>", desc = "Git Files" },
    { "<leader>tgP", "<cmd>Telescope git_files show_untracked=true<cr>", desc = "Git Files." },
    { "<leader>to", "<cmd>Telescope lsp_document_symbols<cr>", desc = "Document symbols" },
    mode = { "n" },
  },
  { -- cmake
    { "<leader>C", group = "CMake Tools" },
    { "<leader>Cb", "<cmd>CMakeBuild<cr>", desc = "Build Target" },
    { "<leader>CB", "<cmd>CMakeSelectBuildTarget<cr>", desc = "Set Build Target" },
    { "<leader>Cr", "<cmd>CMakeRun<cr>", desc = "Run current Launch Target" },
    { "<leader>CR", "<cmd>CMakeSelectLaunchTarget<cr>", desc = "Set Launch Target" },
    { "<leader>CT", "<cmd>CMakeSelectBuildType<cr>", desc = "Set Build Type" },
    { "<leader>Cq", group = "CMake Quicks" },
    { "<leader>Cqr", "<cmd>CMakeQuickRun<cr>", desc = "Quick Run" },
    { "<leader>Cqb", "<cmd>CMakeQuickBuild<cr>", desc = "Quick Run" },
  },
})
