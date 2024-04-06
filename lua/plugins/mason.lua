return {
  "williamboman/mason.nvim",
  opts = {
    ensure_installed = {
      "pyright",
      "clangd",
      "clang-format",
      "cmake-language-server",
      "gopls",
      "rust-analyzer",
      "typescript-language-server",
      "vim-language-server",
      "yaml-language-server",
    },
  },
}
