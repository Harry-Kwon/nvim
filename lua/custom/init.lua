vim.opt.conceallevel = 0
vim.opt.termguicolors = true
vim.wo.relativenumber = true

vim.diagnostic.config({
    virtual_text = false,
    signs = true,
    float = { border = "single" },
})

vim.lsp.enable('postgres_lsp')

require("conform").setup({
    formatters_by_ft = {
        lua = { "stylua", lsp_format = "fallback"},
        -- Conform will run multiple formatters sequentially
        python = {"ruff", "autopep8", lsp_format = "fallback"},
        -- You can customize some of the format options for the filetype (:help conform.format)
        rust = { "rustfmt", lsp_format = "fallback" },
        cpp = { "clang-tidy", lsp_format = "fallback" },
        -- Conform will run the first available formatter
        javascript = { "prettierd", "prettier", stop_after_first = true, lsp_format = "fallback" },
        css = { "prettierd", "prettier", stop_after_first = true, lsp_format = "fallback"},
        json = { "prettierd", "prettier", stop_after_first = true, lsp_format = "fallback"},
        html = { "prettierd", "prettier", stop_after_first = true, lsp_format = "fallback"},
        yaml = { "prettierd", "prettier", stop_after_first = true, lsp_format = "fallback"},
    },
    default_format_opts = {
        lsp_format = "last",
    }
})

vim.g.molten_image_provider = "image.nvim"

-- custom function to fix docker-compose filetypes for lsp attach
vim.api.nvim_create_autocmd({ "BufRead", "BufNewFile" }, {
    pattern = { "docker-compose.yml", "docker-compose.yaml", "compose.yml", "compose.yaml"},
    command = "set filetype=yaml.docker-compose"
})

vim.lsp.enable('postgres_lsp')
