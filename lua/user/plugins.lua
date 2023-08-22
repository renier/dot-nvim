local fn = vim.fn

-- Automatically install packer
local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
	PACKER_BOOTSTRAP = fn.system({
		"git",
		"clone",
		"--depth",
		"1",
		"https://github.com/wbthomason/packer.nvim",
		install_path,
	})
	print("Installing packer close and reopen Neovim...")
	vim.cmd([[packadd packer.nvim]])
end

-- Autocommand that reloads neovim whenever you save the plugins.lua file
vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerSync
  augroup end
]])

-- Use a protected call so we don't error out on first use
local status_ok, packer = pcall(require, "packer")
if not status_ok then
	return
end

-- Have packer use a popup window
packer.init({
	display = {
		open_fn = function()
			return require("packer.util").float({ border = "rounded" })
		end,
	},
})

-- Install your plugins here
return packer.startup(function(use)
	-- My plugins here
	use({
		"wbthomason/packer.nvim",
	})
  -- use("dstein64/vim-startuptime")
	use("nvim-lua/popup.nvim") -- An implementation of the Popup API from vim in Neovim
	use("nvim-lua/plenary.nvim")
  use("mortepau/codicons.nvim")
	use("windwp/nvim-autopairs") -- Autopairs, integrates with both cmp and treesitter
  use("windwp/nvim-ts-autotag")
	use({ "numToStr/Comment.nvim" , requires = { "JoosepAlviste/nvim-ts-context-commentstring" }})
	use("kyazdani42/nvim-web-devicons")
	use({ "kyazdani42/nvim-tree.lua", commit = "7282f7de8aedf861fe0162a559fc2b214383c51c", on =  "NvimTreeToggle" })
	-- use({ "romgrk/barbar.nvim", requires = { "kyazdani42/nvim-web-devicons" } })
	use({ "moll/vim-bbye", commit = "25ef93ac5a87526111f43e5110675032dbcacf56" })
	use({ "nvim-lualine/lualine.nvim" })
	use({ "akinsho/toggleterm.nvim", commit = "aaeed9e02167c5e8f00f25156895a6fd95403af8" })
	use({ "ahmedkhalf/project.nvim", commit = "541115e762764bc44d7d3bf501b6e367842d3d4f" })
	-- use("lewis6991/impatient.nvim")
	-- use({ "lukas-reineke/indent-blankline.nvim", tag = "v2.20.3" })
	use({ "goolord/alpha-nvim", commit = "ef27a59e5b4d7b1c2fe1950da3fe5b1c5f3b4c94" })
	use("antoinemadec/FixCursorHold.nvim") -- This is needed to fix lsp doc highlight
	use("folke/which-key.nvim")

	-- use "godlygeek/tabular"
	use("elzr/vim-json")
	use("tpope/vim-markdown")
	-- use("vim-pandoc/vim-pandoc-syntax")

	-- Colorschemes
	-- use "lunarvim/colorschemes" -- A bunch of colorschemes you can try out
	-- use "lunarvim/darkplus.nvim"
	-- use("overcache/NeoSolarized")
  -- use {
  --   'svrana/neosolarized.nvim',
  --   requires = { 'tjdevries/colorbuddy.nvim' }
  -- }
  use({
    "EdenEast/nightfox.nvim",
    config = function()
      require('nightfox').setup({

      })
      vim.cmd("colorscheme terafox")
    end
  })

	-- cmp plugins
	use("hrsh7th/cmp-buffer") -- buffer completions
	use("hrsh7th/cmp-path") -- path completions
	use("hrsh7th/cmp-cmdline") -- cmdline completions
	use("saadparwaiz1/cmp_luasnip") -- snippet completions
	use("hrsh7th/cmp-vsnip")
	use("hrsh7th/cmp-nvim-lsp")
	use("hrsh7th/nvim-cmp") -- The completion plugin
	use({ "hrsh7th/cmp-nvim-lua" })

	-- snippets
	use("hrsh7th/vim-vsnip")
	use({ "L3MON4D3/LuaSnip" }) --snippet engine
	use({ "rafamadriz/friendly-snippets" }) -- a bunch of snippets to use

	-- LSP
  use("onsails/lspkind-nvim")
	use("neovim/nvim-lspconfig")
	use("williamboman/mason.nvim")
	use("williamboman/mason-lspconfig.nvim")
	use("jose-elias-alvarez/null-ls.nvim")

	use("tamago324/nlsp-settings.nvim") -- language server settings defined in json for rust-tools
	use("simrat39/rust-tools.nvim")
  -- use("RRethy/vim-illuminate")

	-- Telescope
	use({ "nvim-telescope/telescope.nvim", tag = "0.1.1" })

	-- Treesitter
	use({ "nvim-treesitter/nvim-treesitter", tag = "v0.8.5.2", run = ":TSUpdate" })

  -- Highlight word under cursor in visible lines
  use({
    "tzachar/local-highlight.nvim",
    config = function()
      require('local-highlight').setup({
        file_types = {'golang', 'go'},
        -- hlgroup = 'NvimTreeWindowPicker',
        -- cw_hlgroup = 'NvimTreeWindowPicker',
      })
    end
  })

	-- Git
	use("lewis6991/gitsigns.nvim")
	use({
		"ruifm/gitlinker.nvim",
		requires = "nvim-lua/plenary.nvim",
	})
	use("tpope/vim-fugitive")
	use({ "sindrets/diffview.nvim", requires = "nvim-lua/plenary.nvim" })

	-- DAP
	use("mfussenegger/nvim-dap")
  use("nvim-telescope/telescope-dap.nvim")
  use { "rcarriga/nvim-dap-ui", requires = { "mfussenegger/nvim-dap" } }
	use({ "leoluz/nvim-dap-go", commit = "4af956c" }) -- pull from main branch once we are on neovim 0.9

	-- D2
	-- use("terrastruct/d2-vim")

  use("vim-scripts/SyntaxAttr.vim")

	-- Automatically set up your configuration after cloning packer.nvim
	-- Put this at the end after all plugins
	if PACKER_BOOTSTRAP then
		require("packer").sync()
	end
end)
