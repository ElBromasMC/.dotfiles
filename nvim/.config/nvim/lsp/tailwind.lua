---@type vim.lsp.Config
return {
    cmd = { 'tailwindcss-language-server', '--stdio' },
    root_markers = {
        'tailwind.config.js',
        'tailwind.config.cjs',
        'tailwind.config.mjs',
    },
    filetypes = { 'html', 'css', 'javascript', 'templ' },
    settings = {
        tailwindCSS = {
            includeLanguages = {
                templ = 'html',
            },
        },
    },
}
