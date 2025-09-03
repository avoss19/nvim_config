-- Telescope Configuration
local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>pf', builtin.find_files, {})
vim.keymap.set('n', '<C-p>', builtin.git_files, {})

vim.keymap.set('n', '<leader>ps', function()
    builtin.grep_string({ search = vim.fn.input("Grep > ") });
end)

vim.keymap.set('n', '<C-u>', builtin.buffers, {})

local telescope = require('telescope')
telescope.setup({
    defaults = {
        -- layout_config = {
        --     prompt_position = "top",
        -- },
        mappings = {
            i = {
                ["<C-j>"] = require('telescope.actions').move_selection_next,
                ["<C-k>"] = require('telescope.actions').move_selection_previous,
                ["<C-u>"] = require('telescope.actions').close,
                ["<C-q>"] = require('telescope.actions').send_to_qflist,
            }
        },
    },
})

-- Load FZF extension
telescope.load_extension('fzf')

