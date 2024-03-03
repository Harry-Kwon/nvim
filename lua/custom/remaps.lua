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

-- Harpoon
local harpoon = require("harpoon")
harpoon:setup()

-- REQUIRED

wk.register {
    ['<leader>h'] = { name = '[H]arpoon', 'which_key_ignore' }
}

vim.keymap.set("n", "<leader>ha", function() harpoon:list():append() end, { desc = "[H]arpoon list [A]ppend" })
vim.keymap.set("n", "<leader>hq", function() harpoon.ui:toggle_quick_menu(harpoon:list()) end,
    { desc = "[H]arpoon [Q]uick menu" })

vim.keymap.set("n", "<leader>hh", function() harpoon:list():select(1) end, { desc = "[H]arpoon list select 1" })
vim.keymap.set("n", "<leader>hj", function() harpoon:list():select(2) end, { desc = "[H]arpoon list select 2" })
vim.keymap.set("n", "<leader>hk", function() harpoon:list():select(3) end, { desc = "[H]arpoon list select 3" })
vim.keymap.set("n", "<leader>hl", function() harpoon:list():select(4) end, { desc = "[H]arpoon list select 4" })

-- Toggle previous & next buffers stored within Harpoon list
vim.keymap.set("n", "<leader>hp", function() harpoon:list():prev() end, { desc = "[H]arpoon list [P]revious" })
vim.keymap.set("n", "<leader>hn", function() harpoon:list():next() end, { desc = "[H]arpoon list [N]ext " })

local harpoon = require('harpoon')
harpoon:setup({})

-- basic telescope configuration
local conf = require("telescope.config").values
local function toggle_telescope(harpoon_files)
    local file_paths = {}
    for _, item in ipairs(harpoon_files.items) do
        table.insert(file_paths, item.value)
    end

    require("telescope.pickers").new({}, {
        prompt_title = "Harpoon",
        finder = require("telescope.finders").new_table({
            results = file_paths,
        }),
        previewer = conf.file_previewer({}),
        sorter = conf.generic_sorter({}),
    }):find()
end

vim.keymap.set("n", "<leader>hw", function() toggle_telescope(harpoon:list()) end,
    { desc = "Open harpoon window" })
