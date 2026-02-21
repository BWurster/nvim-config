return {
    {
        "williamboman/mason.nvim",
        config = function()
            require("mason").setup()
        end
    },
    {
        "williamboman/mason-lspconfig.nvim",
        config = function()
            require("mason-lspconfig").setup({
                ensure_installed = {
                    "lua_ls", "pyright", "clangd", "html", "cmake",
                    "cssls", "cssmodules_ls", "arduino_language_server"
                }
            })
        end
    },
    {
        "neovim/nvim-lspconfig",
        config = function()
            -- 1. Get your completion capabilities
            local capabilities = require('cmp_nvim_lsp').default_capabilities()
            
            -- 2. List the servers you want to configure
            local servers = {
                "lua_ls", "pyright", "clangd", "html", "cmake",
                "cssls", "cssmodules_ls", "arduino_language_server"
            }

            -- 3. Use the new API to configure and enable them
            for _, lsp in ipairs(servers) do
                -- This replaces lspconfig[lsp].setup()
                vim.lsp.config(lsp, {
                    capabilities = capabilities,
                })
                vim.lsp.enable(lsp)
            end

            -- 4. Your LspAttach autocommand remains largely the same
            vim.api.nvim_create_autocmd('LspAttach', {
                group = vim.api.nvim_create_augroup('UserLspConfig', {}),
                callback = function(ev)
                    vim.bo[ev.buf].omnifunc = 'v:lua.vim.lsp.omnifunc'

                    local function map(mode, lhs, rhs, desc)
                        vim.keymap.set(mode, lhs, rhs, { buffer = ev.buf, desc = desc })
                    end

                    map('n', 'gD', vim.lsp.buf.declaration, "Go to Declaration")
                    map('n', 'gd', vim.lsp.buf.definition, "Go to Definition")
                    map('n', 'K', vim.lsp.buf.hover, "Hover Documentation")
                    map('n', 'gi', vim.lsp.buf.implementation, "Go to Implementation")
                    map('n', '<space>D', vim.lsp.buf.type_definition, "Go to Type Definition")
                    map('n', '<space>rn', vim.lsp.buf.rename, "Rename Buffer")
                    map({ 'n', 'v' }, '<space>ca', vim.lsp.buf.code_action, "Code Action")
                    map('n', 'gr', vim.lsp.buf.references, "Go to References")
                    map('n', '<space>f', function()
                        vim.lsp.buf.format { async = true }
                    end, "Format Buffer")
                end,
            })
        end
    }
}
