return {
  'nvimtools/none-ls.nvim', -- new plugin repo
  dependencies = { 'nvim-lua/plenary.nvim' },
  config = function()
    local null_ls = require("null-ls") -- still called "null-ls" internally
    null_ls.setup({
      sources = {
        null_ls.builtins.formatting.gofmt,
        null_ls.builtins.formatting.golines.with({
          extra_args = { "--max-len=100", "--reformat-tags" },
        }),
        null_ls.builtins.formatting.goimports,
        null_ls.builtins.formatting.prettier,
      },
    })
  end
}

