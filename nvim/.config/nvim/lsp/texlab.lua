---@type vim.lsp.Config
return {
    cmd = { 'texlab' },
    root_markers = {
        '.git',
        '.latexmkrc',
        'latexmkrc',
        '.texlabroot',
        'texlabroot',
        'Tectonic.toml',
    },
    filetypes = { 'tex', 'plaintex', 'bib' },
    settings = {
        texlab = {
            build = {
                executable = 'latexmk',
                args = { '-pdf', '-interaction=nonstopmode', '-synctex=1', '%f' },
                onSave = false,
                forwardSearchAfter = false,
            },
            forwardSearch = {
                executable = 'zathura',
                args = { '--synctex-forward', '%l:1:%f', '%p' },
            },
            chktex = {
                onOpenAndSave = false,
                onEdit = false,
            },
            diagnosticsDelay = 300,
            latexFormatter = 'latexindent',
            latexindent = {
                ['local'] = nil,
                modifyLineBreaks = false,
            },
            bibtexFormatter = 'texlab',
            formatterLineLength = 80,
        },
    },
}
