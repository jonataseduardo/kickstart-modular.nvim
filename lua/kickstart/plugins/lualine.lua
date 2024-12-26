return {
  {
    'nvim-lualine/lualine.nvim',
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    lazy = false,
    priority = 1000,
    opts = {
      options = {
        icons_enabled = true,
        theme = 'everforest',
        section_separators = { left = '', right = '' },
        component_separators = { left = '', right = '' },
      },
    },
  },
}
