vim.keymap.set("n", "<F2>", vim.lsp.buf.rename, { noremap = true, silent = true })
vim.keymap.set("n", "K", vim.lsp.buf.hover, { noremap = true, silent = true })
vim.keymap.set("n", "gr", vim.lsp.buf.references, { noremap = true, silent = true })
vim.keymap.set("i", "<C-k>", vim.lsp.buf.signature_help, { noremap = true, silent = true })
vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, { noremap = true, silent = true })
vim.keymap.set("n", "gw", vim.lsp.buf.workspace_symbol, { noremap = true, silent = true })
vim.keymap.set("n", "<leader>e", vim.diagnostic.open_float, { noremap = true, silent = true })

vim.keymap.set("n", "<leader>p", ":Telescope find_files<CR>", { noremap = true })
vim.keymap.set("n", "<leader>g", ":Telescope live_grep<CR>", { noremap = true })
vim.keymap.set("n", "<leader>z", ":Telescope buffers<CR>", { noremap = true })
vim.keymap.set("n", "<leader>t", ":NvimTreeToggle<CR>", { noremap = true })
vim.keymap.set("n", "<leader>e", ":Trouble diagnostics toggle<CR>", { noremap = true })

-- Fugitive
vim.keymap.set("n", "<leader>Gs", ":Gstatus<CR>", { desc = "Git status" })
vim.keymap.set("n", "<leader>Gd", ":Gdiffsplit<CR>", { desc = "Git diff split" })
vim.keymap.set("n", "<leader>Gb", ":Gblame<CR>", { desc = "Git blame" })
vim.keymap.set("n", "<leader>Gc", ":Git commit<CR>", { desc = "Git commit" })
vim.keymap.set("n", "<leader>Gp", ":Git push<CR>", { desc = "Git push" })

vim.keymap.set("n", "<leader>e", ":Trouble diagnostics toggle<CR>", { noremap = true })

vim.keymap.set("n", "<leader>m", function()
	vim.lsp.buf.format({ bufnr = bufnr })
end, { buffer = bufnr, desc = "Format code" })

vim.keymap.set("n", ";", ":", { noremap = true })

vim.keymap.set('n', '<leader>M', ':Mason<CR>', { noremap = true, silent = true })

vim.keymap.set("n", "]", ":TabbyNext<CR>", { noremap = true })
vim.keymap.set("n", "[", ":TabbyPrev<CR>", { noremap = true })


-- vim.api.nvim_set_keymap('n', 'gd', '<Cmd>lua vim.lsp.buf.definition()<CR>', { noremap = true, silent = true })
vim.keymap.set('n', 'gd', function()
  local params = vim.lsp.util.make_position_params()
  vim.lsp.buf_request(0, 'textDocument/definition', params, function(err, result)
    if result == nil or vim.tbl_isempty(result) then
      print("No definition found")
      return
    end

    -- If it's a list, go to the first location
    local location = result[1] or result
    vim.lsp.util.jump_to_location(location, 'utf-8')
  end)
end, { noremap = true, silent = true })

vim.api.nvim_set_keymap('n', 'ga', '<Cmd>lua vim.lsp.buf.code_action()<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', 'gr', '<Cmd>lua vim.lsp.buf.references()<CR>', { noremap = true, silent = true })

local harpoon = require("harpoon")

-- REQUIRED
harpoon:setup()
-- REQUIRED

vim.keymap.set("n", "<leader>a", function() harpoon:list():add() end)
vim.keymap.set("n", "<leader>l", function() harpoon.ui:toggle_quick_menu(harpoon:list()) end)

vim.keymap.set("n", "<leader>1", function() harpoon:list():select(1) end)
vim.keymap.set("n", "<leader>2", function() harpoon:list():select(2) end)
vim.keymap.set("n", "<leader>3", function() harpoon:list():select(3) end)
vim.keymap.set("n", "<leader>4", function() harpoon:list():select(4) end)

-- Toggle previous & next buffers stored within Harpoon list
vim.keymap.set("n", "<leader>n", function() harpoon:list():prev() end)
vim.keymap.set("n", "<leader>m", function() harpoon:list():next() end)
