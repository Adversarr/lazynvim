local default_capabilities = {
  textDocument = {
    completion = {
      editsNearCursor = true,
    },
  },
  offsetEncoding = "utf-8",
}

local clangd = {
  keys = {
    { "<leader>ch", "<cmd>ClangdSwitchSourceHeader<cr>", desc = "Switch Source/Header (C/C++)" },
  },
  root_dir = function(fname)
    return require("lspconfig.util").root_pattern(
      "Makefile",
      "configure.ac",
      "configure.in",
      "config.h.in",
      "meson.build",
      "meson_options.txt",
      "build.ninja"
    )(fname) or require("lspconfig.util").root_pattern("compile_commands.json", "compile_flags.txt")(fname) or require(
      "lspconfig.util"
    ).find_git_ancestor(fname)
  end,
  capabilities = {
    offsetEncoding = { "utf-16" },
  },
  cmd = {
    "clangd",
    "--background-index",
    "--clang-tidy",
    "--header-insertion=iwyu",
    "--completion-style=detailed",
    "--function-arg-placeholders",
    "--fallback-style=llvm",
  },
  init_options = {
    usePlaceholders = true,
    completeUnimported = true,
    clangdFileStatus = true,
  },
}

-- local clangd = {
--   cmd = {
--     "clangd",
--     "-j=8",
--     "--header-insertion=never",
--     "--ranking-model=heuristics",
--     "--enable-config",
--     "--background-index",
--     "--clang-tidy",
--   },
--   capabilities = default_capabilities,
--   init_options = {
--     clangdFileStatus = true,
--     clangdSemanticHighlighting = true,
--   },
--   filetypes = { "c", "cpp", "cxx", "cc", "cuda" },
--   root_dir = function()
--     vim.fn.getcwd()
--   end,
--   settings = {
--     ["clangd"] = {
--       ["compilationDatabasePath"] = "build",
--       ["fallbackFlags"] = { "-std=c++17" },
--     },
--   },
-- }

local pyright = {}

return {
  {
    "neovim/nvim-lspconfig",
    ---@class PluginLspOpts
    opts = {
      ---@type lspconfig.options
      servers = {
        basedpyright = pyright,
        clangd = clangd,
      },
    },
    setup = {
      clangd = function(_, opts)
        local clangd_ext_opts = LazyVim.opts("clangd_extensions.nvim")
        require("clangd_extensions").setup(vim.tbl_deep_extend("force", clangd_ext_opts or {}, { server = opts }))
        return false
      end,
    },
  },
}
