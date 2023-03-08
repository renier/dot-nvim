-- local status_ok, lsp_installer = pcall(require, "nvim-lsp-installer")
-- if not status_ok then
-- 	return
-- end
--
-- local lspconfig = require("lspconfig")
--
-- local servers = { "gopls", "jsonls", "lua_ls" }
--
-- lsp_installer.setup({
-- 	ensure_installed = servers,
-- })
--
-- for _, server in pairs(servers) do
-- 	local opts = {
-- 		on_attach = require("user.lsp.handlers").on_attach,
-- 		capabilities = require("user.lsp.handlers").capabilities,
-- 	}
-- 	local has_custom_opts, server_custom_opts = pcall(require, "user.lsp.settings." .. server)
-- 	if has_custom_opts then
-- 		opts = vim.tbl_deep_extend("force", opts, server_custom_opts)
-- 	end
-- 	lspconfig[server].setup(opts)
-- end

------------------------
-- Dap
------------------------

local dap_ok, dap = pcall(require, "dap")
if not dap_ok then
  return
end

local dapgo_ok, dapgo = pcall(require, "dap-go")
if not dapgo_ok then
  return
end

dapgo.setup()
dap.adapters.go.executable = vim.tbl_extend("force", dap.adapters.go.executable, { command = "/Users/rmorales/.goenv/shims/dlv" })
local codicons = require('codicons')
vim.fn.sign_define('DapBreakpoint', {text=codicons.get('debug'), texthl='Title', linehl='', numhl=''})
vim.fn.sign_define('DapStopped', {text=codicons.get('debug-pause'), texthl='lspsagabordertitle', linehl='', numhl=''})

-- DAP UI
local dapui = require("dapui")
dapui.setup()
dap.listeners.after.event_initialized["dapui_config"] = function()
  dapui.open()
end
dap.listeners.before.event_terminated["dapui_config"] = function()
  dapui.close()
end
dap.listeners.before.event_exited["dapui_config"] = function()
  dapui.close()
end
