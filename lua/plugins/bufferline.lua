return {
	'akinsho/bufferline.nvim',
	version = "*",
	dependencies = 'nvim-tree/nvim-web-devicons',

    config = function()
	  require("bufferline").setup({
  options = {
    mode = "buffers", -- "tabs" for tab mode
    numbers = "none", -- or "ordinal" | "buffer_id"
    indicator = {
      icon = "▎", -- Icon style for active buffer
      style = "icon",
    },
    buffer_close_icon = "󰅖", -- Nerd Font icon
    modified_icon = "●",
    close_icon = "",
    left_trunc_marker = "",
    right_trunc_marker = "",
    max_name_length = 18,
    max_prefix_length = 15,
    tab_size = 18,
    diagnostics = "nvim_lsp", -- show LSP diagnostics in tab
    diagnostics_update_in_insert = false,
    offsets = {
      {
        filetype = "NvimTree",
        text = "󰙅 File Explorer",
        highlight = "Directory",
        text_align = "left",
      },
    },
    show_buffer_icons = true,
    show_buffer_close_icons = true,
    show_close_icon = true,
    show_tab_indicators = true,
    persist_buffer_sort = true,
    separator_style = "thick", -- "thin", "thick", "slant"
    enforce_regular_tabs = false,
    always_show_bufferline = true,
    sort_by = "insert_after_current",
  },
  highlights = {
    buffer_selected = {
      italic = false,
      bold = true,
    },
    diagnostic_selected = {
      italic = false,
      bold = true,
    },
    hint_selected = {
      italic = false,
      bold = true,
    },
    pick_selected = {
      italic = false,
      bold = true,
    },
  },
})

    end,
}

