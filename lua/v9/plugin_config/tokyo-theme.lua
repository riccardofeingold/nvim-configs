-- Optional: Set up Tokyo Night theme options
vim.g.tokyonight_style = "night"  -- Options: "storm", "night", "moon"
vim.g.tokyonight_italic_comments = true
vim.g.tokyonight_italic_keywords = true
vim.g.tokyonight_italic_functions = false
vim.g.tokyonight_italic_variables = false
vim.g.tokyonight_transparent = false
vim.g.tokyonight_hide_inactive_statusline = false

-- Load the theme
vim.cmd[[colorscheme tokyonight]]
