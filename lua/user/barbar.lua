vim.g.barbar_auto_setup = false

require'barbar'.setup {
  -- maximum_padding = 1,
  auto_hide = true,
  tabpages = false,
  focus_on_close = 'previous',
  icons = {
    button = '',
    separator_at_end = false,
    separator = { left = '', right = '' },
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
    diagnostics = {
      [vim.diagnostic.severity.ERROR] = {enabled = true, icon = ' '},
      [vim.diagnostic.severity.WARN] = {enabled = true, icon = ' '},
      [vim.diagnostic.severity.INFO] = {enabled = true, icon = ' '},
      [vim.diagnostic.severity.HINT] = {enabled = true, icon = ' '},
    },
  },
  sidebar_filetypes = {
    NvimTree = true,
  },
}
