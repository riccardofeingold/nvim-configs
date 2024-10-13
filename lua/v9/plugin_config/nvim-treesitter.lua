-- Treesitter configuration
require'nvim-treesitter.configs'.setup {
  ensure_installed = { "cpp", "python" }, -- Install C++ and Python parsers
  highlight = {
    enable = true,              -- Enable syntax highlighting
    additional_vim_regex_highlighting = false,
  },
  indent = {
    enable = true               -- Enable smart indentation
  }
}

