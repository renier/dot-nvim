vim.cmd [[
  augroup _general_settings
    autocmd!
    autocmd FileType qf,help,man,lspinfo nnoremap <silent> <buffer> q :close<CR> 
    autocmd TextYankPost * silent!lua require('vim.highlight').on_yank({higroup = 'Visual', timeout = 200}) 
    autocmd BufWinEnter * :set formatoptions-=cro
    autocmd FileType qf set nobuflisted
  augroup end

  augroup filetype
    autocmd!
    :autocmd BufRead,BufNewFile *.js,*.lua set ts=2 sw=2 expandtab
    :autocmd BufRead,BufNewFile *.py set expandtab
  augroup end

  augroup _git
    autocmd!
    autocmd FileType gitcommit setlocal wrap
    autocmd FileType gitcommit setlocal spell
  augroup end

  augroup _markdown
    autocmd!
    autocmd FileType markdown setlocal wrap
    autocmd FileType markdown setlocal spell
  augroup end

  augroup pandoc_syntax
    au! BufNewFile,BufFilePre,BufRead *.md set filetype=markdown.pandoc
  augroup end

  augroup _auto_resize
    autocmd!
    autocmd VimResized * tabdo wincmd = 
  augroup end

  augroup _alpha
    autocmd!
    autocmd User AlphaReady set showtabline=0 | autocmd BufUnload <buffer> set showtabline=2
  augroup end

  augroup illuminate_augroup
    autocmd!
    autocmd VimEnter * hi! link IlluminatedWordText ColorColumn
    autocmd VimEnter * hi! link IlluminatedWordRead ColorColumn
    autocmd VimEnter * hi! link IlluminatedWordWrite ColorColumn
    autocmd VimEnter * hi! link LspReferenceText ColorColumn
    autocmd VimEnter * hi! link LspReferenceRead ColorColumn
    autocmd VimEnter * hi! link LspReferenceWrite ColorColumn
  augroup END
]]

-- https://gist.github.com/lkhphuc/ea6db0458268cad1493b2674cb0fda51
local function mod_hl(hl_name, opts)
  local is_ok, hl_def = pcall(vim.api.nvim_get_hl_by_name, hl_name, true)
  if is_ok then
    for k,v in pairs(opts) do hl_def[k] = v end
    vim.api.nvim_set_hl(0, hl_name, hl_def)
  end
end

-- vim.api.nvim_create_autocmd({"VimEnter", "ColorScheme"}, {
--   group = vim.api.nvim_create_augroup('BufferlineHighlightOverrides', {}),
--   pattern = "*",
--   callback = function ()
--     for _, suffix in ipairs({'', 'ERROR', 'HINT', 'INFO', 'WARN', 'Index', 'Mod', 'Sign', 'Target'}) do
--       mod_hl("BufferDefaultCurrent" .. suffix, { bold=true })
--     end
--   end
-- })
vim.api.nvim_create_autocmd({"VimEnter", "ColorScheme"}, {
  group = vim.api.nvim_create_augroup('BarbarHighlightOverrides', {}),
  pattern = "*",
  callback = function ()
    for _, suffix in ipairs({'', 'ERROR', 'HINT', 'INFO', 'WARN', 'Index', 'Mod', 'Sign', 'SignRight', 'Target', 'Icon'}) do
      vim.api.nvim_set_hl(0, "BufferCurrent" .. suffix, { bold = true, bg = '#5a93aa', fg = '#0f1c1e' })
      vim.api.nvim_set_hl(0, "BufferVisible" .. suffix, { bg = '#5a93aa', fg = '#0f1c1e' })
      vim.api.nvim_set_hl(0, "BufferInactive" .. suffix, { fg = '#5a93aa', bg = '#0f1c1e' })
    end
    vim.api.nvim_set_hl(0, "BufferInactiveSign", { fg = '#0f1c1e', bg = '#0f1c1e' })
    vim.api.nvim_set_hl(0, "BufferInactiveSignRight", { bg = '#0f1c1e', fg = '#5a93aa' })
    vim.api.nvim_set_hl(0, "BufferCurrentSign", { fg = '#0f1c1e', bg = '#5a93aa' })
    vim.api.nvim_set_hl(0, "BufferCurrentSignRight", { bg = '#0f1c1e', fg = '#5a93aa' })
    vim.api.nvim_set_hl(0, "BufferVisibleSign", { fg = '#0f1c1e', bg = '#5a93aa' })
    vim.api.nvim_set_hl(0, "BufferVisibleSignRight", { bg = '#0f1c1e', fg = '#5a93aa' })
  end
})
