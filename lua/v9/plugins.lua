local ensure_packer = function() 
    local fn = vim.fn 
    local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim' 
    if fn.empty(fn.glob(install_path)) > 0 then
        fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path}) 
        vim.cmd [[packadd packer.nvim]] 
        return true
    end
    return false
end

local packer_bootstrap = ensure_packer()

return require('packer').startup(function(use)
    use 'wbthomason/packer.nvim'
    use "github/copilot.vim"
    -- My plugins here
    -- use 'tpope/vim-fugitive'
     use {
        'NeogitOrg/neogit',
        requires = {
        'nvim-lua/plenary.nvim',
        'sindrets/diffview.nvim',
        'nvim-tree/nvim-web-devicons'
        }
    }
    use "sindrets/diffview.nvim" 
    use {'akinsho/bufferline.nvim', tag = "v4.*"}
    use 'ellisonleao/gruvbox.nvim'
    use 'nvim-tree/nvim-tree.lua'
    use 'nvim-tree/nvim-web-devicons'
    use 'nvim-lualine/lualine.nvim'
    -- use 'folke/tokyonight.nvim'
    use 'navarasu/onedark.nvim'
    use {
        'nvim-telescope/telescope.nvim', tag = '0.1.x',
        requires = { {'nvim-lua/plenary.nvim'} }
    }
    use 'numToStr/Comment.nvim'
    use {
        "mfussenegger/nvim-dap",  -- DAP base plugin
        "rcarriga/nvim-dap-ui",   -- Optional UI for DAP
        "mfussenegger/nvim-dap-python",  -- Python-specific DAP adapter
        'nvim-neotest/nvim-nio',
        "theHamsta/nvim-dap-virtual-text"
    }

    -- Tab completion
    use 'hrsh7th/nvim-cmp' -- Completion engine
    use 'hrsh7th/cmp-nvim-lsp' -- LSP source for nvim-cmp
    use 'hrsh7th/cmp-buffer' -- Buffer completions
    use 'hrsh7th/cmp-path' -- Path completions
    use 'hrsh7th/cmp-cmdline' -- Cmdline completions
    use 'hrsh7th/cmp-vsnip' -- Snippet completions
    use 'hrsh7th/vim-vsnip' -- Snippet plugin
    
    -- Treesitter (Syntax Highlighting)
    use {
        'nvim-treesitter/nvim-treesitter',
        run = ':TSUpdate'
    }
    use "lukas-reineke/indent-blankline.nvim"
    -- LSP Configuration & Installers
    use 'neovim/nvim-lspconfig' -- Basic LSP support
    use 'williamboman/nvim-lsp-installer' -- Simple to use LSP installer
    
    use {"akinsho/toggleterm.nvim", tag = 'v2.*'}  -- Add toggleterm plugin

    -- Other useful plugins
    use 'onsails/lspkind-nvim' -- Adds vscode-like pictograms to nvim-cmp-- Automatically set up your configuration after cloning packer.nvim
    -- Put this at the end after all plugins
    if packer_bootstrap then
        require('packer').sync()
    end
end)
