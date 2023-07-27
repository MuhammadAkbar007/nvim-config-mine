-- Packer bootstrap
local ensure_packer = function()
	local fn = vim.fn
	local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
	if fn.empty(fn.glob(install_path)) > 0 then
		fn.system({ "git", "clone", "--depth", "1", "https://github.com/wbthomason/packer.nvim", install_path })
		vim.cmd([[packadd packer.nvim]])
		return true
	end
	return false
end

local packer_bootstrap = ensure_packer()

return require("packer").startup(function(use)
	-- install packer
	use("wbthomason/packer.nvim")

	-- syntax highlighting in all file formats
	use("nvim-treesitter/nvim-treesitter", { run = ":TSUpdate" })

	-- autopairs
	use("windwp/nvim-autopairs")
	use("windwp/nvim-ts-autotag")

	-- icons pack
	use("nvim-tree/nvim-web-devicons")

	-- fuzzy finder
	use({
		"nvim-telescope/telescope.nvim",
		tag = "0.1.2",
		-- or                            , branch = '0.1.x',
		requires = { { "nvim-lua/plenary.nvim" } },
	})

	-- file explorer tree
	use({
		"nvim-tree/nvim-tree.lua",
		requires = {
			"nvim-tree/nvim-web-devicons", -- optional
		},
	})

	-- line written in lua
	use("nvim-lualine/lualine.nvim")

	-- Dracula theme
	use("Mofiqul/dracula.nvim")

	-- Github theme
	--  use({
	--	  'projekt0n/github-nvim-theme',
	--	  config = function()
	--		  require('github-theme').setup({
	--			  options = {
	--				transparent = true,
	--				dim_inactive = true, darken = {                 -- Darken floating windows and sidebar-like windows floats = false,
	--				sidebars = {
	--					enable = true,
	--					list = {},             -- Apply dark background to specific windows
	--				},
	--			},
	--			  }
	--		  })
	--
	--		  vim.cmd('colorscheme github_dark_colorblind')
	--	  end
	--  })

	-- snippets
	use("hrsh7th/nvim-cmp")
	use("hrsh7th/cmp-buffer")
	use("hrsh7th/cmp-path")
	use("L3MON4D3/LuaSnip")
	use("saadparwaiz1/cmp_luasnip")
	use("rafamadriz/friendly-snippets")

	-- LSP
	use("williamboman/mason.nvim")
	use("williamboman/mason-lspconfig.nvim")
	use("neovim/nvim-lspconfig")
	use("hrsh7th/cmp-nvim-lsp")
	use({
		"glepnir/lspsaga.nvim",
		branch = "main",
		requires = {
			{ "nvim-tree/nvim-web-devicons" },
			{ "nvim-treesitter/nvim-treesitter" },
		},
	}) -- enhanced lsp uis
	use("mfussenegger/nvim-jdtls")
	use("onsails/lspkind.nvim")
	use("jose-elias-alvarez/null-ls.nvim")
	use("jayp0521/mason-null-ls.nvim")

	-- git integration signs
	--	use("lewis6991/gitsigns.nvim")

	-- multiple tabs
	use({ "akinsho/bufferline.nvim", tag = "*", requires = "nvim-tree/nvim-web-devicons" })

	-- Automatically set up your configuration after cloning packer.nvim
	-- Put this at the end after all plugins
	if packer_bootstrap then
		require("packer").sync()
	end
end)
