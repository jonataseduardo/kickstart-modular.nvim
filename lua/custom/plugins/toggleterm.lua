return {
  { -- Terminal
    'akinsho/toggleterm.nvim',
    version = '*',
    cmd = { 'ToggleTerm', 'TermExec' },
    keys = {
      { '<leader>ft', '<cmd>ToggleTerm direction=float<cr>', desc = 'ToggleTerm (float)' },
      { '<leader>fh', '<cmd>ToggleTerm direction=horizontal<cr>', desc = 'ToggleTerm (horizontal)' },
      { '<leader>fv', '<cmd>ToggleTerm direction=vertical<cr>', desc = 'ToggleTerm (vertical)' },
    },
    opts = {
      size = 20,
      open_mapping = [[<c-\>]],
      hide_numbers = true,
      shade_filetypes = {},
      shade_terminals = true,
      shading_factor = 2,
      start_in_insert = true,
      insert_mappings = true,
      persist_size = true,
      direction = 'float',
      close_on_exit = true,
      shell = vim.o.shell,
      float_opts = {
        border = 'curved',
        winblend = 0,
        highlights = {
          border = 'Normal',
          background = 'Normal',
        },
      },
    },
  },
}
-- vim: ts=2 sts=2 sw=2 et