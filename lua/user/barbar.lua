vim.g.barbar_auto_setup = false

require'barbar'.setup {
  maximum_padding = 1,
  auto_hide = true,
  tabpages = false,
  icons = {
    button = '',
    separator_at_end = false,
    -- separator = {left = '', right = ''},
    separator = { left = '', right = '' },
    -- inactive = {separator = {left = '', right = ''}},
    -- inactive = { separator = { left = '╱', right = '╲' } },
    inactive = { separator = { left = '', right = '' } },
    visible = { separator = { left = '', right = '' } },
    gitsigns = {
      added = {enabled = false},
      changed = {enabled = false},
      deleted = {enabled = false},
    },
    preset = 'powerline',
    filetype = {
      custom_colors = true,
      enabled = true,
    },
  },
  sidebar_filetypes = {
    NvimTree = true,
  },
}
