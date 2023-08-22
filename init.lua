vim.cmd [[
if exists('+termguicolors')
let &t_8f="\<Esc>[38;2;%lu;%lu;%lum"
  let &t_8b="\<Esc>[48;2;%lu;%lu;%lum"
  set termguicolors
endif
]]

require "user.options"
require "user.keymaps"
require "user.plugins"
-- require "user.impatient"
require "user.colorscheme"
require "user.lspkind"
require "user.cmp"
require "user.lsp"
-- require "user.illuminate"
require "user.telescope"
require "user.treesitter"
require "user.autopairs"
require "user.ts-autotag"
require "user.comment"
require "user.gitsigns"
require "user.nvim-tree"
require "user.lualine"
require "user.toggleterm"
require "user.project"
-- require "user.indentline"
require "user.alpha"
require "user.whichkey"
require "user.autocommands"
require "user.gitlinker"
-- require "user.rust"
-- require "user.bufferline"
