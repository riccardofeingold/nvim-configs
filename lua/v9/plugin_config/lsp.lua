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

-- LSP server for C++ (clangd)
lspconfig.clangd.setup{
  on_attach = on_attach
}

-- LSP server for Python (pyright)
lspconfig.pyright.setup{
  on_attach = on_attach
}
