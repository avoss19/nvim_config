vim.g.mapleader = ' '
vim.keymap.set('n', '<leader>pv', vim.cmd.Ex)
vim.keymap.set('n', '<leader>pw', function()
    vim.cmd.w()
    vim.cmd.BufferClose()
end)

vim.keymap.set('n', '<C-q>', function()
    vim.cmd.bd()
end)

-- tab
vim.keymap.set('n', '<leader>tn', vim.cmd.tabnew)

-- window split
vim.keymap.set('n', '<leader>sv', vim.cmd.split)
vim.keymap.set('n', '<leader>sh', vim.cmd.vsplit)

-- navigate <C-hjkl> for window splits
vim.keymap.set('n', '<C-h>', ':wincmd h<CR>')
vim.keymap.set('n', '<C-j>', ':wincmd j<CR>')
vim.keymap.set('n', '<C-k>', ':wincmd k<CR>')
vim.keymap.set('n', '<C-l>', ':wincmd l<CR>')

-- resize splits Ctrl + Shift + hjkl
vim.keymap.set('n', '<S-h>', ':vertical resize -2<CR>')
vim.keymap.set('n', '<S-j>', ':resize -2<CR>')
vim.keymap.set('n', '<S-k>', ':resize +2<CR>')
vim.keymap.set('n', '<S-l>', ':vertical resize +2<CR>')

-- Open splits
vim.keymap.set('n', '<leader>sh', vim.cmd.split)
vim.keymap.set('n', '<leader>sv', vim.cmd.vsplit)
