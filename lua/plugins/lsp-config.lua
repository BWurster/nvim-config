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
                    "rust_analyzer",
                    "gopls",
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
            lspconfig.lua_ls.setup {}
            lspconfig.tsserver.setup {}
            lspconfig.pyright.setup {}
            lspconfig.rust_analyzer.setup {
              -- Server-specific settings. See `:help lspconfig-setup`
              settings = {
                ['rust-analyzer'] = {},
              },
            }
            lspconfig.gopls.setup {}
            lspconfig.clangd.setup {}
            lspconfig.html.setup {}
            lspconfig.cmake.setup {}
            lspconfig.cssls.setup {}
            lspconfig.cssmodules_ls.setup {}
            lspconfig.arduino_language_server.setup {}

            vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts)
        end
    }
}
