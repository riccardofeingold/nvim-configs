return {
    {
        'nvim-treesitter/nvim-treesitter',
        build = ':TSUpdate',
        config = function()
            local config = require('nvim-treesitter.configs')
            config.setup({
                ensure_installed = {"cpp", "python"},
                highlight = {
                    enable = true,
                    additional_vim_regex_highlighting = false
                },
                indent = {
                    enable = true
                }
            })
        end
    }
}