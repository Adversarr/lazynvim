return {
  "williamboman/mason.nvim",
  opts = {
    ensure_installed = {
      "stylua",
      "shellcheck",
      "shfmt",
      "ruff",
      "cmakelang",
      "cmakelint",
      "codelldb",
      "debugpy",
    },
  },
}
