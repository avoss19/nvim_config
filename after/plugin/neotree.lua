local neotree = require("neo-tree").setup({
    close_if_last_window = true,
    window = {
        mappings = {
            ["D"] = "add_directory",
            ["N"] = "add"
        }
    },
        opts = {
            sources = { "filesystem", "buffers", "git_status" },
            source_selector = {
            sources = {
                { source = "filesystem", display_name = "A" },
                { source = "buffers", display_name = "B" },
                { source = "git_status", display_name = "C" },
                { source = "diagnostics", display_name = "D" },
            },
        }
}

});

vim.cmd([[ let g:neo_tree_remove_legacy_commands = 1 ]]);

vim.keymap.set("n", "<C-t>", ":NeoTreeShowToggle<CR>", { silent = true });
vim.keymap.set("n", "<leader>nt", ":NeoTreeFloatToggle<CR>", { silent = true });
