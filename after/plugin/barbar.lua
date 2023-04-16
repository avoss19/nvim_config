local map = vim.api.nvim_set_keymap;
local opts = { noremap = true, silent = true };

-- Move to tag
map('n', '<C-1>', '<Cmd>BufferGoto 1<CR>', opts);
map('n', '<C-2>', '<Cmd>BufferGoto 2<CR>', opts);
map('n', '<C-3>', '<Cmd>BufferGoto 3<CR>', opts);
map('n', '<C-4>', '<Cmd>BufferGoto 4<CR>', opts);
map('n', '<C-5>', '<Cmd>BufferGoto 5<CR>', opts);
map('n', '<C-6>', '<Cmd>BufferGoto 6<CR>', opts);
map('n', '<C-7>', '<Cmd>BufferGoto 7<CR>', opts);
map('n', '<C-8>', '<Cmd>BufferGoto 8<CR>', opts);
map('n', '<C-9>', '<Cmd>BufferGoto 9<CR>', opts);
map('n', '<C-0>', '<Cmd>BufferLast<CR>', opts);

-- Move to previous/next
map('n', '<TAB>', '<Cmd>BufferNext<CR>', opts);
map('n', '<S-TAB>', '<Cmd>BufferPrevious<CR>', opts);
map('n', '<C-c>', '<Cmd>BufferClose<CR>', opts);

