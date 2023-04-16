-- Packer Config
return require('packer').startup(function(use)
    use 'wbthomason/packer.nvim'

    use { "EdenEast/nightfox.nvim", as = "nightfox" }

    use {
        'nvim-telescope/telescope.nvim',
        tag = '0.1.1',
        requires = {
            { 'nvim-lua/plenary.nvim' },
            { 'BurntSushi/ripgrep' },
        }
    }

    use({ 'nvim-telescope/telescope-fzf-native.nvim', run = 'make' }) -- Theme

    use('nvim-treesitter/nvim-treesitter', { run = ':TSUpdate' })
    use('nvim-treesitter/playground')

    use('ThePrimeagen/harpoon')
    use('ThePrimeagen/refactoring.nvim')

    use('mbbill/undotree')

    use { 'tpope/vim-fugitive', as = 'fugitive' }

    use {
        'VonHeikemen/lsp-zero.nvim',
        branch = 'v1.x',
        requires = {
            -- LSP Support
            { 'neovim/nvim-lspconfig' },
            { 'williamboman/mason.nvim' },
            { 'williamboman/mason-lspconfig.nvim' },

            -- Autocompletion
            { 'hrsh7th/nvim-cmp' },
            { 'hrsh7th/cmp-buffer' },
            { 'hrsh7th/cmp-path' },
            { 'saadparwaiz1/cmp_luasnip' },
            { 'hrsh7th/cmp-nvim-lsp' },
            { 'hrsh7th/cmp-nvim-lua' },


            -- Snippets
            { 'L3MON4D3/LuaSnip' },
            { 'rafamadriz/friendly-snippets' },
        }
    }

    use("github/copilot.vim")

    use {
        "nvim-neo-tree/neo-tree.nvim",
        branch = "v2.x",
        requires = {
            "nvim-lua/plenary.nvim",
            "nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
            "MunifTanjim/nui.nvim",
        }
    }

    use("preservim/tagbar")
    use("tpope/vim-commentary")
    use 'nvim-tree/nvim-web-devicons'
    use { 'romgrk/barbar.nvim', requires = 'nvim-web-devicons' }

    use {
        "folke/which-key.nvim",
        config = function()
            vim.o.timeout = true
            vim.o.timeoutlen = 300
        end
    }

    use("sudormrfbin/cheatsheet.nvim")
    use("nvim-lualine/lualine.nvim")
    use("lewis6991/gitsigns.nvim")
end)
