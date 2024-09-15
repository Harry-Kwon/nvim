vim.opt.conceallevel = 0
vim.opt.termguicolors = true

vim.diagnostic.config({
    virtual_text = false,
    signs = true,
    float = { border = "single" },
})

require("conform").setup({
    formatters_by_ft = {
        lua = { "stylua" },
        -- Conform will run multiple formatters sequentially
        python = { "isort", "black", "autopep8" },
        -- You can customize some of the format options for the filetype (:help conform.format)
        rust = { "rustfmt", lsp_format = "fallback" },
        cpp = { "clang-tidy", lsp_format = "fallback" },
        -- Conform will run the first available formatter
        javascript = { "prettierd", "prettier", stop_after_first = true },
    },
})
