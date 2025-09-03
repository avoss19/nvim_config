-- Packer Config
return require('packer').startup(function(use)
    -- Packer
    use 'wbthomason/packer.nvim'

    -- Dressing
    use 'stevearc/dressing.nvim'

    -- Completion
    use {
        'hrsh7th/nvim-cmp',
        requires = {
            'hrsh7th/cmp-buffer',
            'hrsh7th/cmp-path',
            'hrsh7th/cmp-nvim-lsp',
            'hrsh7th/cmp-nvim-lua',
            'saadparwaiz1/cmp_luasnip',
            'L3MON4D3/LuaSnip',
            'rafamadriz/friendly-snippets',
        }
    }

    -- -- LSP
    -- use {
    --     'neovim/nvim-lspconfig',
    --     requires = {
    --         -- 'williamboman/nvim-lsp-installer',
    --         'kabouzeid/nvim-lspinstall',
    --         'ray-x/lsp_signature.nvim',
    --     }
    -- }
    
    -- LSP
    use {
        'VonHeikemen/lsp-zero.nvim',
        -- branch = 'v1.x',
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

    -- -- Prettier 
    use {
        'sbdchd/neoformat',
        cmd = { 'Neoformat' },
        requires = {
            'nvim-lua/plenary.nvim',
            'mhartington/formatter.nvim',
            'dense-analysis/ale'
        }
    }


    -- CoPilot
    use("github/copilot.vim")
    
    -- Alt CoPilot
    -- use("zbirenbaum/copilot.lua")

--    use {
--        "zbirenbaum/copilot.lua",
--        cmd = "Copilot",
--        event = "InsertEnter",
--        }



    -- Theme
    use { "EdenEast/nightfox.nvim", as = "nightfox" }

    -- Telescope
    use {
        'nvim-telescope/telescope.nvim',
        -- tag = '0.1.4',
        requires = {
            { 'nvim-lua/plenary.nvim' },
            { 'BurntSushi/ripgrep' },
            { 'nvim-telescope/telescope-fzf-native.nvim', run = 'make' },
            { 'nvim-tree/nvim-web-devicons' },
        }
    }
    use('nvim-treesitter/nvim-treesitter', { run = ':TSUpdate' })
    use('nvim-treesitter/playground')


    -- Go Debugger
    use{
        'leoluz/nvim-dap-go',
        requires = {
            'mfussenegger/nvim-dap',
            'theHamsta/nvim-dap-virtual-text',
            'nvim-telescope/telescope-dap.nvim',
        }
    }
    use{
        'ray-x/go.nvim',
        -- tag = 'v0.2.1',
        requires = {
            'ray-x/guihua.lua',
            'neovim/nvim-lspconfig',
            'nvim-treesitter/nvim-treesitter',
            -- 'nvim-lua/plenary.nvim',
            -- 'nvim-lua/popup.nvim',
            -- 'nvim-telescope/telescope.nvim',
            -- 'nvim-telescope/telescope-dap.nvim',
            -- 'theHamsta/nvim-dap-virtual-text',
            -- 'mfussenegger/nvim-dap',
        }
    }
    use {
        "rcarriga/nvim-dap-ui",
        requires = {
            "mfussenegger/nvim-dap",
            "nvim-telescope/telescope-dap.nvim",
            "nvim-neotest/nvim-nio"
        },
    }

    -- ThePrimeagen
    use('ThePrimeagen/harpoon')
    use('ThePrimeagen/refactoring.nvim')

    -- UndoTree
    use('mbbill/undotree')

    -- Fugitive
    use { 'tpope/vim-fugitive', as = 'fugitive' }

    use {
        "nvim-neo-tree/neo-tree.nvim",
        branch = "v2.x",
        requires = {
            "nvim-lua/plenary.nvim",
            "nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
            "MunifTanjim/nui.nvim",
        }
    }

    -- Tagbar
    use("preservim/tagbar")

    use("tpope/vim-commentary")
    -- use("tpope/vim-surround")
    -- use("tpope/vim-dadbod")

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
    use("gelguy/wilder.nvim")

    -- Goto Preview 
    use {
  'rmagatti/goto-preview',
  config = function()
    require('goto-preview').setup {}
  end
}

    -- Markdown Preview
   -- install without yarn or npm
    -- use({
    --     "iamcco/markdown-preview.nvim",
    --     run = function() vim.fn["mkdp#util#install"]() end,
    -- })

    -- Markdown Preview
    use({ "iamcco/markdown-preview.nvim", run = "cd app && npm install", setup = function() vim.g.mkdp_filetypes = { "markdown" } end, ft = { "markdown" }, }) 


    -- avante
    
  -- Required plugins
  use 'stevearc/dressing.nvim'
  use 'nvim-lua/plenary.nvim'
  use 'MunifTanjim/nui.nvim'
  use 'MeanderingProgrammer/render-markdown.nvim'

  -- Optional dependencies
  use 'hrsh7th/nvim-cmp'
  use 'nvim-tree/nvim-web-devicons' -- or use 'echasnovski/mini.icons'
  use 'HakonHarnes/img-clip.nvim'
  use 'zbirenbaum/copilot.lua'

  -- Avante.nvim with build process
  use {
    'yetone/avante.nvim',
    branch = 'main',
    run = 'make',
    config = function()
      require('avante_lib').load()
      require('avante').setup()
    end
  }
end)
