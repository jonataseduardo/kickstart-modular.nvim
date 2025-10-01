local M = {
  'akinsho/toggleterm.nvim',
  event = 'VeryLazy',
}

function M.config()
  require('toggleterm').setup {
    size = 20,
    open_mapping = [[<c-\>]],
    hide_numbers = true, -- hide the number column in toggleterm buffers
    shade_filetypes = {},
    shade_terminals = true,
    shading_factor = 2, -- the degree by which to darken to terminal colour, default: 1 for dark backgrounds, 3 for light
    start_in_insert = true,
    insert_mappings = true, -- whether or not the open mapping applies in insert mode
    persist_size = false,
    direction = "horizontal", -- Better for Ghostty integration
    close_on_exit = true, -- close the terminal window when the process exits
    shell = vim.env.SHELL or '/bin/zsh', -- Use system shell for Ghostty compatibility
    float_opts = {
      border = 'rounded',
      winblend = 0,
      highlights = {
        border = 'Normal',
        background = 'Normal',
      },
    },
    --    winbar = {
    --      enabled = true,
    --      name_formatter = function(term) --  term: Terminal
    --        return term.count
    --      end,
    --    },
  }

  function _G.set_terminal_keymaps()
    local opts = { noremap = true, silent = true }
    local trim_spaces = false
    vim.keymap.set('t', '<esc>', [[<C-\><C-n>]], opts)

    vim.keymap.set({ 'n', 'v' }, '<leader>ll', function()
      require('toggleterm').send_lines_to_terminal('single_line', trim_spaces, { args = vim.v.count, trim_spaces = trim_spaces })
    end, { desc = 'Send lines to terminal' })

    vim.keymap.set('v', '<leader>lv', function()
      require('toggleterm').send_lines_to_terminal('visual_lines', trim_spaces, { args = vim.v.count, trim_spaces = trim_spaces })
    end, { desc = 'Send visual lines to terminal' })

    vim.keymap.set('v', '<leader>ls', function()
      require('toggleterm').send_lines_to_terminal('visual_selection', trim_spaces, { args = vim.v.count, trim_spaces = trim_spaces })
    end, { desc = 'Send visual selection to terminal' })

    vim.api.nvim_buf_set_keymap(0, 't', '<c-h>', [[<C-\><C-n><C-W>h]], opts)
    vim.api.nvim_buf_set_keymap(0, 't', '<c-j>', [[<C-\><C-n><C-W>j]], opts)
    vim.api.nvim_buf_set_keymap(0, 't', '<c-k>', [[<C-\><C-n><C-W>k]], opts)
    vim.api.nvim_buf_set_keymap(0, 't', '<c-l>', [[<C-\><C-n><C-W>l]], opts)
    vim.keymap.set('t', '<C-w>', [[<C-\><C-n><C-w>]], opts)
  end

  vim.cmd 'autocmd! TermOpen term://* lua set_terminal_keymaps()'
end

return M
