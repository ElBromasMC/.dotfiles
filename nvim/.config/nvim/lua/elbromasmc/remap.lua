-- :h key-notation
vim.g.mapleader = vim.keycode('<space>')
vim.keymap.set('n', '<leader>pv', vim.cmd.Ex)
vim.keymap.set('i', '<C-c>', '<Esc>')

-- Remap SQL omni complete
vim.g.ftplugin_sql_omni_key = '<C-j>'

-- Basic fzf bindings
vim.api.nvim_set_keymap("n", "<C-\\>", [[<Cmd>lua require"fzf-lua".buffers()<CR>]], {})
vim.api.nvim_set_keymap("n", "<C-k>", [[<Cmd>lua require"fzf-lua".builtin()<CR>]], {})
vim.api.nvim_set_keymap("n", "<C-p>", [[<Cmd>lua require"fzf-lua".files()<CR>]], {})
vim.api.nvim_set_keymap("n", "<C-l>", [[<Cmd>lua require"fzf-lua".live_grep()<CR>]], {})
vim.api.nvim_set_keymap("n", "<C-g>", [[<Cmd>lua require"fzf-lua".grep_project()<CR>]], {})
vim.api.nvim_set_keymap("n", "<F1>", [[<Cmd>lua require"fzf-lua".help_tags()<CR>]], {})

--require("fzf-lua").utils.info("|<C-\\> buffers|<C-p> files|<C-g> grep|<C-l> live grep|<C-k> builtin|<F1> help|")

