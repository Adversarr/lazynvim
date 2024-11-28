local sysname = vim.loop.os_uname().sysname
local anaconda_base_path = {
  Linux = {
    anaconda_base = {
      command = "$FD '/python$' ~/anaconda3/bin/ --full-path --color never",
      type = "anaconda",
    },

    anaconda_envs = {
      command = "$FD 'bin/python$' ~/anaconda3/envs --full-path --color never",
      type = "anaconda",
    },
  },
  Darwin = {
    anaconda_base = {
      command = "$FD '/python$' /opt/homebrew/Caskroom/miniconda/base/bin/ --full-path --color never",
      type = "anaconda",
    },
    anaconda_envs = {
      command = "$FD 'bin/python$' /opt/homebrew/Caskroom/miniconda/base/envs/ --full-path --color never",
      type = "anaconda",
    },
  },
}

return {
  "linux-cultist/venv-selector.nvim",
  branch = "regexp", -- Use this branch for the new version
  cmd = "VenvSelect",
  enabled = function()
    if LazyVim ~= nil then
      return LazyVim.has("venv-selector.nvim")
    end
  end,
  opts = {
    settings = {
      options = {
        notify_user_on_venv_activation = true,
      },

      search = anaconda_base_path[sysname] or {},
    },
  },
  --  Call config for python files and load the cached venv automatically
  ft = "python",
  keys = { { "<leader>cv", "<cmd>:VenvSelect<cr>", desc = "Select VirtualEnv", ft = "python" } },
}
