vim.g.mapleader = ' '
vim.keymap.set('n', '<leader>pv', vim.cmd.Ex)
vim.keymap.set('n', '<leader>pw', function()
	vim.cmd.w()
	vim.cmd.Ex()
end)
vim.keymap.set('n', '<leader>pq', function()
	vim.cmd.bd()
end)
