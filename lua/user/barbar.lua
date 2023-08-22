vim.g.barbar_auto_setup = false

require'barbar'.setup {
  auto_hide = true,
  tabpages = false,
  icons = {
    button = '',
    separator_at_end = true,
    separator = {left = '', right = ''},
    inactive = {separator = {left = '', right = ''}},
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
