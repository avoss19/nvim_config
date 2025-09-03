-- cmp config
-- Auto-completion


local cmp = require("cmp")
local luasnip = require("luasnip")

-- Load vscode style snippets
require("luasnip/loaders/from_vscode").load()

cmp.setup({
    completion = {
        completeopt = "menu,menuone,preview,noselect",
    },
    snippet = {
        expand = function(args)
            luasnip.lsp_expand(args.body)
        end,
    },
    mappings = cmp.mapping.preset.insert({
        ['<C-k>'] = cmp.mapping.select_prev_item(),
        ['<C-j>'] = cmp.mapping.select_next_item(),
        ['<C-Space>'] = cmp.mapping.complete(),
        ['<C-q>'] = cmp.mapping.abort(),
        ['<CR>'] = cmp.mapping.confirm({ select = false }),
    }),
    -- Sources for autocomplete (order affects proriety in results)
    sources = cmp.config.sources({
        -- { name = "nvim_lsp" },
        { name = "luasnip" }, -- snippets
        { name = "buffer" }, -- text w/in buffer
        { name = "path" }, -- file paths
        -- { name = "calc" }, -- simple calculations
        -- { name = "emoji" }, -- emojis
        -- { name = "treesitter" }, -- treesitter
        -- { name = "spell" }, -- spelling
        -- { name = "tags" }, -- tags
        -- { name = "latex_symbols" }, -- latex symbols
        -- { name = "look" }, -- look
        -- { name = "tmux" }, -- tmux
        -- { name = "vsnip" }, -- snippets
        -- { name = "orgmode" }, -- orgmode
    }),
})


