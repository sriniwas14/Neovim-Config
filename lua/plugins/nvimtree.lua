return {
  "nvim-tree/nvim-tree.lua",
  version = "*",
  lazy = false, -- important: load on startup
  dependencies = {
    "nvim-tree/nvim-web-devicons", -- optional, for file icons
  },
  config = function()
    require("nvim-tree").setup({
      view = {
        width = 30,
        side = "left",
        signcolumn = "yes",
      },
      renderer = {
        highlight_git = true,
        highlight_opened_files = "name",
        indent_markers = { enable = true },
        icons = {
          glyphs = {
            folder = {
              default = "",
              open = "",
              arrow_closed = "",
              arrow_open = "",
            },
            git = {
              staged = "✓",
              unstaged = "✗",
              untracked = "★",
            },
          },
        },
      },
      filters = {
        dotfiles = false,
      },
      git = {
        enable = true,
        ignore = false,
      },
    })

    -- Optional: open tree when Neovim starts in a directory
    vim.api.nvim_create_autocmd("VimEnter", {
      callback = function()
        if vim.fn.isdirectory(vim.fn.argv()[1] or "") == 1 then
          require("nvim-tree.api").tree.open()
        end
      end,
    })
  end,
  keys = {
    { "<leader>e", "<cmd>NvimTreeToggle<CR>", desc = "Toggle File Tree" },
  },
}

