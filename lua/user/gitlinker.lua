require"gitlinker".setup({
  callbacks = {
    ["github.com"] = require"gitlinker.hosts".get_github_type_url,
    ["github.ibm.com"] = require"gitlinker.hosts".get_github_type_url,
    ["gitlab.com"] = require"gitlinker.hosts".get_gitlab_type_url,
    ["code.8labs.io"] = require"gitlinker.hosts".get_gitlab_type_url
  }
})

-- To make gitlinker work in visual mode
local opts = { noremap = true, silent = true }
local keymap = vim.api.nvim_set_keymap
keymap("v", "gy", '<cmd>lua require"gitlinker".get_buf_range_url("v")<CR>', opts)

