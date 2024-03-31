return {
  {
    "neovim/nvim-lspconfig",
    config = function()
      local nvim_lsp = require("lspconfig")
      nvim_lsp.clangd.setup({
        cmd = { "clangd" },
        filetypes = { "c", "cpp", "objc", "objcpp", "cuda", "proto" },
        root_dir = nvim_lsp.util.root_pattern(
          ".clangd",
          ".clang-tidy",
          ".clang-format",
          "compile_commands.json",
          "compile_flags.txt",
          "configure.ac",
          ".git"
        ),
        init_options = {
          compilationDatabasePath = "./build",
        },
      })
    end,
  },
  {
    "neovim/nvim-lspconfig",
    config = function()
      lspconfig = require("lspconfig")
      lspconfig.pyright.setup({
        filetypes = { "python" },
      })
    end,
  },
  {
    "neovim/nvim-lspconfig",
    config = function()
      lspconfig = require("lspconfig")
      lspconfig.tsserver.setup({
        cmd = { "typescript-language-server", "--stdio" },
        on_attach = on_attach,
        filetypes = { "typescript", "typescriptreact", "typescript.tsx" },
      })
    end,
  },
}
