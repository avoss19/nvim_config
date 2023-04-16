vim.g.mapleader = ' '
vim.keymap.set('n', '<leader>pv', vim.cmd.Ex)

vim.keymap.set('n', '<leader>pw', function()
	vim.cmd.w()
	vim.cmd.BufferClose()
end)

vim.keymap.set('n', '<C-q>', function()
	vim.cmd.bd()
end)

