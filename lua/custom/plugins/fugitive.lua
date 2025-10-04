return {
  { -- Git commands in nvim
    'tpope/vim-fugitive',
    event = 'VeryLazy',
    keys = {
      { '<leader>gs', '<cmd>Git<cr>', desc = 'Git status' },
      { '<leader>gc', '<cmd>Git commit<cr>', desc = 'Git commit' },
      { '<leader>gp', '<cmd>Git push<cr>', desc = 'Git push' },
      { '<leader>gl', '<cmd>Git pull<cr>', desc = 'Git pull' },
    },
  },
}
-- vim: ts=2 sts=2 sw=2 et