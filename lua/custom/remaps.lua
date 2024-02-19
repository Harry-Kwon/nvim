local wk = require("which-key")

local nmap = function(keys, func, desc)
    vim.keymap.set('n', keys, func, { buffer = bufnr, desc = desc })
end

nmap('<leader>p', vim.cmd.Ex, 'netrw explorer')

local nvim_test = require('nvim-test')
wk.register {
    ['<leader>T'] = { name = '[T]est', _ = 'which_key_ignore' }
}
nmap('<leader>Ta', '<cmd>TestSuite<cr>', '[T]est [A]ll (Suite)')
nmap('<leader>Tf', '<cmd>TestFile<cr>', '[T]est [F]ile')
nmap('<leader>Tc', '<cmd>TestNearest<cr>', '[T]est nearest to [C]ursor')
nmap('<leader>Te', '<cmd>TestEdit<cr>', '[T]est [E]dit for current file')
nmap('<leader>Tl', '<cmd>TestLast<cr>', '[T]est [L]ast test')
nmap('<leader>Tv', '<cmd>TestLast<cr>', '[T]est [V]isit last test')
nmap('<leader>Ti', '<cmd>TestLast<cr>', '[T]est [I]nfo about nvim-test plugin')

-- vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)
-- wk.register(
--     {
--         pv = { "Open netrw explorer" }
--     },
--     { prefix = "<leader>" }
-- )
