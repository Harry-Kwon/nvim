local wk = require("which-key")

vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)
wk.register(
    {
        pv = { "Open netrw explorer" }
    },
    { prefix = "<leader>" }
)
