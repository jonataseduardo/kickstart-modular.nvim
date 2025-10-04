return {
  'mrjones2014/smart-splits.nvim',
  lazy = false, -- Load immediately
  config = function()
    local smart_splits = require('smart-splits')
    smart_splits.setup({
      at_edge = 'stop',
    })
    
    -- Keymaps for navigation - using Ctrl+hjkl for smart-splits functionality
    vim.keymap.set('n', '<C-h>', function() smart_splits.move_cursor_left() end, { desc = 'Move cursor left (smart-splits)' })
    vim.keymap.set('n', '<C-j>', function() smart_splits.move_cursor_down() end, { desc = 'Move cursor down (smart-splits)' })
    vim.keymap.set('n', '<C-k>', function() smart_splits.move_cursor_up() end, { desc = 'Move cursor up (smart-splits)' })
    vim.keymap.set('n', '<C-l>', function() smart_splits.move_cursor_right() end, { desc = 'Move cursor right (smart-splits)' })
    
    -- Alternative keymaps using leader key for better macOS compatibility
    vim.keymap.set('n', '<leader>h', function() smart_splits.move_cursor_left() end, { desc = 'Move cursor left (smart-splits)' })
    vim.keymap.set('n', '<leader>j', function() smart_splits.move_cursor_down() end, { desc = 'Move cursor down (smart-splits)' })
    vim.keymap.set('n', '<leader>k', function() smart_splits.move_cursor_up() end, { desc = 'Move cursor up (smart-splits)' })
    vim.keymap.set('n', '<leader>l', function() smart_splits.move_cursor_right() end, { desc = 'Move cursor right (smart-splits)' })
  end
}