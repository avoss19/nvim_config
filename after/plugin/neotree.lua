local neotree = require("neo-tree").setup({
    close_if_last_window = true,
    window = {
        mappings = {
            ["D"] = "add_directory",
            ["N"] = "add"
        }
    }
});

vim.cmd([[ let g:neo_tree_remove_legacy_commands = 1 ]]);

vim.keymap.set("n", "<C-t>", ":NeoTreeShowToggle<CR>", { silent = true });
vim.keymap.set("n", "<leader>nt", ":NeoTreeFloatToggle<CR>", { silent = true });
