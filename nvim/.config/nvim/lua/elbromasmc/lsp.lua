-- :h lsp-config
vim.api.nvim_create_autocmd('LspAttach', {
    group = vim.api.nvim_create_augroup('my.lsp', {}),
    callback = function(args)
        local client = assert(vim.lsp.get_client_by_id(args.data.client_id))

        -- Enable auto-completion. Note: Use CTRL-Y to select an item. |complete_CTRL-Y|
        if client:supports_method('textDocument/completion') then
            vim.lsp.completion.enable(true, client.id, args.buf)
        end

        -- Auto-format ("lint") on save.
        -- Usually not needed if server supports "textDocument/willSaveWaitUntil".
        if not client:supports_method('textDocument/willSaveWaitUntil')
            and client:supports_method('textDocument/formatting') then
            vim.api.nvim_create_autocmd('BufWritePre', {
                group = vim.api.nvim_create_augroup('my.lsp', { clear = false }),
                buffer = args.buf,
                callback = function()
                    vim.lsp.buf.format({ bufnr = args.buf, id = client.id, timeout_ms = 1000 })
                end,
            })
        end
    end,
})

-- Diagnostics
vim.diagnostic.config({ virtual_lines = true })

-- Custom configuration
vim.lsp.config('clangd', {
    cmd = { 'clangd', '--fallback-style=webkit' },
})

vim.lsp.config('texlab', {
    settings = {
        texlab = {
            build = {
                executable = 'latexmk',
                args = { '-pdf', '-interaction=nonstopmode', '-synctex=1', '%f' },
                onSave = true,
                forwardSearchAfter = false,
            },
            forwardSearch = {
                executable = 'zathura',
                args = { '--synctex-forward', '%l:1:%f', '%p' },
            },
            -- diagnosticsDelay = 1500,
        },
    },
})

-- Enable configured language servers
vim.lsp.enable({
    'clangd',
    'gopls',
    'templ',
    'tailwindcss',
    'pyright',
    'texlab',
    --'html_ls',
})

