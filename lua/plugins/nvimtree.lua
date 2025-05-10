return {
    "nvim-tree/nvim-tree.lua",
    config = function()
      require("nvim-tree").setup({
        auto_reload_on_write = true,
        update_focused_file = {
          enable = true,
          update_cwd = true,
        },
        view = {
          width = 30,
          side = "left",
        },
      })
    end,
  }
