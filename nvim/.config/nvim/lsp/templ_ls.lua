---@type vim.lsp.Config
return {
    cmd = { 'templ', 'lsp' },
    root_markers = { 'go.work', 'go.mod', '.git' },
    filetypes = { 'templ' },
}
