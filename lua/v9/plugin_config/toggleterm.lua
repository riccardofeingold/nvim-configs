require("toggleterm").setup{
  -- These are the default settings
  size = 20,                   -- Terminal height or width
  open_mapping = [[<c-\>]],     -- Shortcut to toggle terminal
  hide_numbers = true,          -- Hide line numbers in terminal buffers
  shade_filetypes = {},
  shade_terminals = true,
  shading_factor = '1',         -- Degree of shading for terminal windows
  start_in_insert = true,
  insert_mappings = true,       -- Enable opening terminal in insert mode
  terminal_mappings = true,     -- Use terminal key mappings
  persist_size = true,
  direction = 'horizontal',     -- Other options: 'vertical' | 'float'
  close_on_exit = true,         -- Close terminal when the process exits
  shell = vim.o.shell,          -- Default shell
}

