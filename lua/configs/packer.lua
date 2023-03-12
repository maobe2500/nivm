-- This file can be loaded by calling `lua require('plugins')` from your init.vim
--
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
	-- Only required if you have packer configured as `opt`
	vim.cmd([[packadd packer.nvim]])
end

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

return packer.startup(function(use)
  -- Packer can manage itself
  use({'wbthomason/packer.nvim'})

  -- Plugin for searching
  use({'nvim-telescope/telescope.nvim', tag = '0.1.1',
    -- or                             , branch = '0.1.x',
    requires = { {'nvim-lua/plenary.nvim'} }
  })


  ------------------------  Themes  ------------------------
  use { "catppuccin/nvim", as = "catppuccin" }
  use({
      'rose-pine/neovim',
      as = 'rose-pine',
      config = function()
        require("rose-pine").setup()
        vim.cmd('colorscheme rose-pine')
      end
   })


  -- Useful plugins
  use('nvim-treesitter/nvim-treesitter', {run = ':TSUpdate'})
  use('nvim-treesitter/playground')
  use('nvim-lua/plenary.nvim')
  use('ThePrimeagen/harpoon')
  use('mbbill/undotree')
  use('tpope/vim-fugitive')


  ------------  Language support and Autocompletion  ------------
  use {
	  'VonHeikemen/lsp-zero.nvim',
		branch = 'v1.x',
		requires = {
			-- LSP Support
			{'neovim/nvim-lspconfig'},             -- Required
			{'williamboman/mason.nvim'},           -- Optional
			{'williamboman/mason-lspconfig.nvim'}, -- Optional

			-- Autocompletion
			{'hrsh7th/nvim-cmp'},         -- Required
			{'hrsh7th/cmp-nvim-lsp'},     -- Required
			{'hrsh7th/cmp-buffer'},       -- Optional
			{'hrsh7th/cmp-path'},         -- Optional
			{'saadparwaiz1/cmp_luasnip'}, -- Optional
			{'hrsh7th/cmp-nvim-lua'},     -- Optional

			-- Snippets
			{'L3MON4D3/LuaSnip'},             -- Required
			{'rafamadriz/friendly-snippets'}, -- Optional
    }
  }


  -- Popups in nvim 
  use('nvim-lua/popup.nvim')


  	-- Colorize color codes
	use({
		"norcalli/nvim-colorizer.lua",
		config = function()
			require("configs.colorizer")
		end,
		-- ft = {'css', 'javascript', 'json', 'scss', 'vim'}
		ft = {},
	})


  	-- Use alternating colors for nested perens
	use({
		"p00f/nvim-ts-rainbow",
		config = function()
			require("configs.tsrainbow")
		end,
	})


  -- auto pairs
	use({
		"windwp/nvim-autopairs",
		config = function()
			require("configs.autopairs")
		end,
	})

  
	-- Markdown preview
	use({
		"iamcco/markdown-preview.nvim",
		run = "cd app && npm install",
		setup = function()
			vim.g.mkdp_filetypes = { "markdown" }
		end,
		ft = { "markdown" },
	})

  
	-- Add/delete/change surrounds
	use({
		"kylechui/nvim-surround",
		config = function()
			require("nvim-surround").setup({
				-- Configuration here, or leave empty to use defaults
			})
		end,
	})


  --------------------------  Start screen in vim!  --------------------------
  use({
    "glepnir/dashboard-nvim",
    config = function()
      require("configs.dashboard")
    end,
  })

  -- Pretty symbols
	use({
		"kyazdani42/nvim-web-devicons",
		config = function()
			require("nvim-web-devicons").setup({ default = true })
		end,
	})

  -- Use "zoxide" inside nvim (remembers where you cd): https://github.com/jvgrootveld/telescope-zoxide
  use('jvgrootveld/telescope-zoxide')


  use({"akinsho/toggleterm.nvim", tag = '*',
    config = function()
      require("toggleterm").setup()
    end
  })

  use({"elkowar/yuck.vim"})


	if PACKER_BOOTSTRAP then
		packer.sync()
	end

end)
