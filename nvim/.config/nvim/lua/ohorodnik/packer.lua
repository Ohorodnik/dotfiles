vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
    -- Packer can manage itself
    use 'wbthomason/packer.nvim'

    use {
        'nvim-telescope/telescope.nvim', tag = '0.1.4',
        requires = { { 'nvim-lua/plenary.nvim' } }
    }

    use { "catppuccin/nvim", as = "catppuccin" }

    use("nvim-treesitter/nvim-treesitter", { run = ":TSUpdate" })

    use({
        "kylechui/nvim-surround",
        tag = "*", -- Use for stability; omit to use `main` branch for the latest features
    })

    use 'mbbill/undotree'

    use 'tpope/vim-fugitive'

    use {
      'VonHeikemen/lsp-zero.nvim',
      branch = 'v3.x',
      requires = {
        --- Uncomment these if you want to manage LSP servers from neovim
        {'williamboman/mason.nvim'},
        {'williamboman/mason-lspconfig.nvim'},

        -- LSP Support
        {'neovim/nvim-lspconfig'},
        -- Autocompletion
        {'hrsh7th/nvim-cmp'},
        {'hrsh7th/cmp-nvim-lsp'},
        {'L3MON4D3/LuaSnip'},
      }
    }

    use "lukas-reineke/indent-blankline.nvim"

    use "windwp/nvim-ts-autotag"

    use 'numToStr/Comment.nvim'

    use "theprimeagen/harpoon"

    use "RRethy/vim-illuminate"

    use "windwp/nvim-autopairs"

    use 'nmac427/guess-indent.nvim'

    use "kiyoon/treesitter-indent-object.nvim"

    use {
        'nvim-lualine/lualine.nvim',
        requires = { 'nvim-tree/nvim-web-devicons', opt = true },
    }

    use "lewis6991/gitsigns.nvim"

    use 'mfussenegger/nvim-jdtls'

    use 'mfussenegger/nvim-dap'

    use "folke/which-key.nvim"

    use {
        'nvim-tree/nvim-tree.lua',
        requires = {
            'nvim-tree/nvim-web-devicons', -- optional
        }
    }

    use 'nvim-tree/nvim-web-devicons'

    use 'jose-elias-alvarez/null-ls.nvim'

    use 'simrat39/rust-tools.nvim'
end)
