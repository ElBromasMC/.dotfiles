
require('fzf-lua').setup({
    defaults = { git_icons = false }
})

require('elbromasmc.set')
require('elbromasmc.remap')
require('elbromasmc.treesitter')
require('elbromasmc.lsp')

vim.cmd([[colorscheme modus_vivendi]])

