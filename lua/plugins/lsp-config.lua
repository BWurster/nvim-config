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
                    "lua_ls",
                    "tsserver",
                    "pyright",
                    "clangd",
                    "html",
                    "cmake",
                    "cssls",
                    "cssmodules_ls",
                    "arduino_language_server"
                }
            })
        end
    },
    {
        "neovim/nvim-lspconfig",
        config = function()
            local lspconfig = require('lspconfig')
            local capabilities = require('cmp_nvim_lsp').default_capabilities()
            lspconfig.lua_ls.setup {
                capabilities = capabilities
            }
            lspconfig.tsserver.setup {
                capabilities = capabilities
            }
            lspconfig.pyright.setup {
                capabilities = capabilities
            }
            lspconfig.clangd.setup {
                capabilities = capabilities
            }
            lspconfig.html.setup {
                capabilities = capabilities
            }
            lspconfig.cmake.setup {
                capabilities = capabilities
            }
            lspconfig.cssls.setup {
                capabilities = capabilities
            }
            lspconfig.cssmodules_ls.setup {
                capabilities = capabilities
            }
            lspconfig.arduino_language_server.setup {
                capabilities = capabilities
            }

            -- Use LspAttach autocommand to only map the following keys
            -- after the language server attaches to the current buffer
            vim.api.nvim_create_autocmd('LspAttach', {
                group = vim.api.nvim_create_augroup('UserLspConfig', {}),
                callback = function(ev)
                    -- Enable completion triggered by <c-x><c-o>
                    vim.bo[ev.buf].omnifunc = 'v:lua.vim.lsp.omnifunc'

                    -- Buffer local mappings.
                    -- See `:help vim.lsp.*` for documentation on any of the below functions
                    local opts = { buffer = ev.buf }
                    vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, { desc = "Go to Declaration", buffer = ev.buf })
                    vim.keymap.set('n', 'gd', vim.lsp.buf.definition, { desc = "Go to Definition", buffer = ev.buf })
                    vim.keymap.set('n', 'K', vim.lsp.buf.hover, { desc = "Hover Documentation", buffer = ev.buf })
                    vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, { desc = "Go to Implementation", buffer = ev.buf })
                    -- vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, opts)
                    -- vim.keymap.set('n', '<space>wa', vim.lsp.buf.add_workspace_folder, opts)
                    -- vim.keymap.set('n', '<space>wr', vim.lsp.buf.remove_workspace_folder, opts)
                    -- vim.keymap.set('n', '<space>wl', function()
                    --     print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
                    -- end, opts)
                    vim.keymap.set('n', '<space>D', vim.lsp.buf.type_definition, { desc = "Go to Type Definition", buffer = ev.buf })
                    vim.keymap.set('n', '<space>rn', vim.lsp.buf.rename, { desc = "Rename Buffer", buffer = ev.buf })
                    vim.keymap.set({ 'n', 'v' }, '<space>ca', vim.lsp.buf.code_action, { desc = "Code Action", buffer = ev.buf })
                    vim.keymap.set('n', 'gr', vim.lsp.buf.references, { desc = "Go to References", buffer = ev.buf })
                    vim.keymap.set('n', '<space>f', function()
                        vim.lsp.buf.format { async = true }
                    end, { desc = "Format Buffer", buffer = ev.buf })
                end,
            })
        end
    }
}
