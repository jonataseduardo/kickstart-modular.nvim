-- Ghostty terminal configuration
-- This replaces tmux.nvim with Ghostty-compatible terminal configuration
-- Ghostty handles window management, clipboard sync, and terminal features natively

local function setup_ghostty()
  -- Configure terminal behavior for Ghostty
  vim.g.terminal_color_0 = '#090618'
  vim.g.terminal_color_1 = '#c34043'
  vim.g.terminal_color_2 = '#76946a'
  vim.g.terminal_color_3 = '#c0a36e'
  vim.g.terminal_color_4 = '#7e9cd8'
  vim.g.terminal_color_5 = '#957fb8'
  vim.g.terminal_color_6 = '#6a9589'
  vim.g.terminal_color_7 = '#c8c093'
  vim.g.terminal_color_8 = '#727169'
  vim.g.terminal_color_9 = '#e82424'
  vim.g.terminal_color_10 = '#98bb6c'
  vim.g.terminal_color_11 = '#e6c384'
  vim.g.terminal_color_12 = '#7fb4ca'
  vim.g.terminal_color_13 = '#938aa9'
  vim.g.terminal_color_14 = '#7aa89f'
  vim.g.terminal_color_15 = '#dcd7ba'

  -- Set terminal background to match Kanagawa theme
  vim.g.terminal_color_background = '#1f1f28'
  vim.g.terminal_color_foreground = '#dcd7ba'

  -- Configure clipboard for Ghostty
  -- Ghostty handles clipboard integration natively
  if vim.fn.has('mac') == 1 then
    vim.g.clipboard = {
      name = 'macOS-clipboard',
      copy = {
        ['+'] = 'pbcopy',
        ['*'] = 'pbcopy',
      },
      paste = {
        ['+'] = 'pbpaste',
        ['*'] = 'pbpaste',
      },
      cache_enabled = 0,
    }
  end

  -- Enhanced terminal keymaps for Ghostty
  -- These replace tmux navigation functionality
  local function setup_ghostty_keymaps()
    -- Terminal mode keymaps
    local term_opts = { noremap = true, silent = true }
    
    -- Exit terminal mode
    vim.keymap.set('t', '<Esc>', '<C-\\><C-n>', term_opts)
    vim.keymap.set('t', '<C-[>', '<C-\\><C-n>', term_opts)
    
    -- Window navigation in terminal mode (replaces tmux navigation)
    vim.keymap.set('t', '<C-h>', '<C-\\><C-n><C-w>h', term_opts)
    vim.keymap.set('t', '<C-j>', '<C-\\><C-n><C-w>j', term_opts)
    vim.keymap.set('t', '<C-k>', '<C-\\><C-n><C-w>k', term_opts)
    vim.keymap.set('t', '<C-l>', '<C-\\><C-n><C-w>l', term_opts)
    
    -- Window operations in terminal mode
    vim.keymap.set('t', '<C-w>', '<C-\\><C-n><C-w>', term_opts)
    
    -- Resize windows in terminal mode (replaces tmux resize)
    vim.keymap.set('t', '<A-h>', '<C-\\><C-n><C-w><', term_opts)
    vim.keymap.set('t', '<A-j>', '<C-\\><C-n><C-w>-', term_opts)
    vim.keymap.set('t', '<A-k>', '<C-\\><C-n><C-w>+', term_opts)
    vim.keymap.set('t', '<A-l>', '<C-\\><C-n><C-w>>', term_opts)
  end

  -- Apply keymaps when terminal opens
  vim.api.nvim_create_autocmd('TermOpen', {
    pattern = 'term://*',
    callback = setup_ghostty_keymaps,
    desc = 'Setup Ghostty terminal keymaps',
  })

  -- Additional Ghostty-specific configurations
  -- Enable better terminal integration
  vim.opt.termguicolors = true
  
  -- Configure terminal behavior
  vim.opt.shell = vim.env.SHELL or '/bin/zsh'
  
  -- Better terminal scrolling
  vim.opt.scrollback = 10000
end

-- Initialize Ghostty configuration
setup_ghostty()