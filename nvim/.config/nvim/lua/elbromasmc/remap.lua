-- :h key-notation
vim.g.mapleader = vim.keycode('<space>')
vim.keymap.set('n', '<leader>pv', vim.cmd.Ex)
vim.keymap.set('i', '<C-c>', '<Esc>')

-- Remap SQL omni complete
vim.g.ftplugin_sql_omni_key = '<C-j>'

