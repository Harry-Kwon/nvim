local wk = require("which-key")

vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)
wk.register(
    {
        e = { "Open netrw explorer" }
    },
    { prefix = "<leader>" }
)
