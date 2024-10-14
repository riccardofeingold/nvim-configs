-- Set up LSP servers for C++ and Python
local lspconfig = require'lspconfig'

-- Keybindings for LSP
local on_attach = function(client, bufnr)
  local opts = { noremap=true, silent=true }

  -- LSP keybindings
  vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gd', '<Cmd>lua vim.lsp.buf.definition()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', 'K', '<Cmd>lua vim.lsp.buf.hover()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gr', '<Cmd>lua vim.lsp.buf.references()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gi', '<Cmd>lua vim.lsp.buf.implementation()<CR>', opts)
end

vim.o.updatetime = 300

-- Configure Neovim diagnostics
vim.diagnostic.config({
    -- virtual_text = {
    --     prefix = "●",  -- You can choose any symbol like "●" to represent the diagnostic
    --     spacing = 2,   -- Space between the code and the virtual text (error message)
    -- },
    virtual_text = false,
    signs = true,              -- Show diagnostic signs in the sign column
    update_in_insert = false,  -- Avoid updating diagnostics during insert mode
    float = {
        source = "always",     -- Show the source of the diagnostic
        focusable = false,     -- Don't focus on the floating window (avoid interruptions)
        border = "rounded",    -- Nice border around floating window
        format = function(diagnostic)
            return string.format("[%s] %s", diagnostic.source, diagnostic.message)
        end,
    },
})

-- Variable to keep track of diagnostic state
local diagnostics_active = true

-- Function to toggle diagnostics floating window
local function toggle_diagnostics()
    if diagnostics_active then
        vim.api.nvim_clear_autocmds({ event = "CursorHold" })
        print("Diagnostics floating window disabled")
    else
        vim.api.nvim_create_autocmd("CursorHold", {
            callback = function()
                vim.diagnostic.open_float(nil, { focusable = false })
            end,
        })
        print("Diagnostics floating window enabled")
    end
    diagnostics_active = not diagnostics_active
end

-- Keybinding to toggle diagnostics
vim.keymap.set('n', '<leader>d', toggle_diagnostics, { noremap = true, silent = true })

-- LSP server for C++ (clangd)
lspconfig.clangd.setup{
  on_attach = on_attach
}

-- LSP server for Python (pyright)
lspconfig.pyright.setup{
  on_attach = on_attach
}
