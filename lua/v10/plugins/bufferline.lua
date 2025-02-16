return {
    {'akinsho/bufferline.nvim', version = "v4.*", dependencies = 'nvim-tree/nvim-web-devicons',
        config = function()
            require("bufferline").setup{}
        end
    }
}