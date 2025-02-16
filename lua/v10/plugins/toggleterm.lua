  return {
    {
        'akinsho/toggleterm.nvim', 
        version = "*",
        config = function()
            require("toggleterm").setup{
                size = 20,
                open_mapping = [[<c-\>]],
                hide_numbers = true, -- hide the number column in toggleterm buffers
                shade_filetypes = {},
                shade_terminals = true,
                shading_factor = '1', -- the degree by which to darken to terminal colour, default: 1 for dark backgrounds, 3 for light
                start_in_insert = true,
                insert_mappings = true, -- whether or not the open mapping applies in insert mode
                persist_size = true,
                direction = 'horizontal',
                close_on_exit = true, -- close the terminal window when the process exits
                shell = vim.o.shell, -- change the default shell
            }

            vim.cmd [[
                autocmd! TermOpen term://* lua set_terminal_keymaps()
            ]]

            function _G.set_terminal_keymaps()
                local opts = {noremap = true}
                vim.api.nvim_buf_set_keymap(0, 't', '<Esc>', [[<C-\><C-n>]], opts)
            end
        end
    }
  }