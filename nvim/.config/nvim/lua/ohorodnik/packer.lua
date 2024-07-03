vim.cmd [[packadd packer.nvim]]
local is_vscode = vim.g.vscode ~= nil
print("VSCode: ", is_vscode)

return require('packer').startup(function(use)
    -- Packer can manage itself
    use 'wbthomason/packer.nvim'

    use {
        'nvim-telescope/telescope.nvim', tag = '0.1.4',
        requires = { { 'nvim-lua/plenary.nvim' } },
        disable = is_vscode,
    }

    use { "catppuccin/nvim", as = "catppuccin", disable = is_vscode }

    use { "nvim-treesitter/nvim-treesitter", run = ":TSUpdate", disable = is_vscode }

    use {
        "kylechui/nvim-surround",
        tag = "*", -- Use for stability; omit to use `main` branch for the latest features
        disable = is_vscode,
    }

    use { 'mbbill/undotree', disable = is_vscode }

    use { 'tpope/vim-fugitive', disable = is_vscode }

    use {
        'VonHeikemen/lsp-zero.nvim',
        branch = 'v3.x',
        requires = {
            --- Uncomment these if you want to manage LSP servers from neovim
            { 'williamboman/mason.nvim' },
            { 'williamboman/mason-lspconfig.nvim' },

            -- LSP Support
            { 'neovim/nvim-lspconfig' },
            -- Autocompletion
            { 'hrsh7th/nvim-cmp' },
            { 'hrsh7th/cmp-nvim-lsp' },
            { 'L3MON4D3/LuaSnip' },
        },
        disable = is_vscode,
    }

    use { "lukas-reineke/indent-blankline.nvim", disable = is_vscode }

    use { "RRethy/vim-illuminate", disable = is_vscode }

    use { "windwp/nvim-autopairs", disable = is_vscode }

    use { 'nmac427/guess-indent.nvim', disable = is_vscode }

    use {"kiyoon/treesitter-indent-object.nvim", disable = is_vscode}

    use {
        'nvim-lualine/lualine.nvim',
        requires = { 'nvim-tree/nvim-web-devicons', opt = true },
    }

    use { "lewis6991/gitsigns.nvim", disable = is_vscode }

    use { 'mfussenegger/nvim-jdtls', disable = is_vscode }

    use { 'mfussenegger/nvim-dap', disable = is_vscode }

    use {"folke/which-key.nvim", disable = is_vscode}

    use {
        'nvim-tree/nvim-tree.lua',
        requires = {
            'nvim-tree/nvim-web-devicons', -- optional
        },
        disable = is_vscode,
    }

    use { 'nvim-tree/nvim-web-devicons', disable = is_vscode }

    use { 'jose-elias-alvarez/null-ls.nvim', disable = is_vscode }

    use { 'simrat39/rust-tools.nvim', disable = is_vscode }

    use { "github/copilot.vim", disable = is_vscode }
end)
