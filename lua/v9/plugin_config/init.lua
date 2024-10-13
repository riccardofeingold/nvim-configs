require("v9.plugin_config.gruvbox")
require("v9.plugin_config.lualine")
require("v9.plugin_config.nvim-tree")
require("v9.plugin_config.nvim-cmp")
require("v9.plugin_config.lsp")
require("v9.plugin_config.nvim-treesitter")
require("v9.plugin_config.toggleterm")
require("v9.plugin_config.bufferline")
require("v9.plugin_config.telescope")
require("v9.plugin_config.identation-line")
-- require("v9.plugin_config.tokyo-theme")
require("v9.plugin_config.pydebug")

-- PACKAGES WITHOUT CUSTOM CONFIGS
require("Comment").setup()
require("nvim-dap-virtual-text").setup()
require('onedark').setup {
  style = 'darker'  -- Can also be 'darker', 'cool', 'warm', etc.
}
require('onedark').load()
