require("lvim.lsp.manager").setup("marksman")

require("lvim.lsp.null-ls.linters").setup {
    {
        name = "markdownlint",
        filetypes = { "markdown" }
    }
}

require("lvim.lsp.null-ls.formatters").setup {
    {
        name = "markdownlint",
        filetypes = { "markdown" }
    }
}
