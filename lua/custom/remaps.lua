local wk = require 'which-key'

local nmap = function(keys, func, desc)
  vim.keymap.set('n', keys, func, { buffer = bufnr, desc = desc })
end

-- navigate file tree
-- nmap('<leader>p', vim.cmd.Ex, 'netrw explorer')
local oil = require 'oil'
nmap('<leader>p', '<cmd>Oil<cr>', 'Oil explorerer')
nmap('<leader>P', vim.cmd.Ex, 'netrw explorer')

local nvim_test = require 'nvim-test'
wk.add {
  { '<leader>T', group = '[T]est' },
}
nmap('<leader>Ta', '<cmd>TestSuite<cr>', '[T]est [A]ll (Suite)')
nmap('<leader>Tf', '<cmd>TestFile<cr>', '[T]est [F]ile')
nmap('<leader>Tc', '<cmd>TestNearest<cr>', '[T]est nearest to [C]ursor')
nmap('<leader>Te', '<cmd>TestEdit<cr>', '[T]est [E]dit for current file')
nmap('<leader>Tl', '<cmd>TestLast<cr>', '[T]est [L]ast test')
nmap('<leader>Tv', '<cmd>TestLast<cr>', '[T]est [V]isit last test')
nmap('<leader>Ti', '<cmd>TestLast<cr>', '[T]est [I]nfo about nvim-test plugin')


nmap('<leader>f', '<cmd>Format<cr>', '[F]ormat')
-- vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)
-- wk.register(
--     {
--         pv = { "Open netrw explorer" }
--     },
--     { prefix = "<leader>" }
-- )

-- Harpoon
local harpoon = require 'harpoon'
harpoon:setup()

-- REQUIRED

wk.add {
  { '<leader>h', group = '[H]arpoon', --[[ hidden = true ]] },
}

vim.keymap.set('n', '<leader>ha', function()
  harpoon:list():add()
end, { desc = '[H]arpoon list [A]ppend' })
vim.keymap.set('n', '<leader>hq', function()
  harpoon.ui:toggle_quick_menu(harpoon:list())
end, { desc = '[H]arpoon [Q]uick menu' })

vim.keymap.set('n', '<leader>hh', function()
  harpoon:list():select(1)
end, { desc = '[H]arpoon list select 1' })
vim.keymap.set('n', '<leader>hj', function()
  harpoon:list():select(2)
end, { desc = '[H]arpoon list select 2' })
vim.keymap.set('n', '<leader>hk', function()
  harpoon:list():select(3)
end, { desc = '[H]arpoon list select 3' })
vim.keymap.set('n', '<leader>hl', function()
  harpoon:list():select(4)
end, { desc = '[H]arpoon list select 4' })

-- Toggle previous & next buffers stored within Harpoon list
vim.keymap.set('n', '<leader>hp', function()
  harpoon:list():prev()
end, { desc = '[H]arpoon list [P]revious' })
vim.keymap.set('n', '<leader>hn', function()
  harpoon:list():next()
end, { desc = '[H]arpoon list [N]ext ' })

-- basic telescope configuration
local conf = require('telescope.config').values
local function toggle_telescope(harpoon_files)
  local file_paths = {}
  for _, item in ipairs(harpoon_files.items) do
    table.insert(file_paths, item.value)
  end

  require('telescope.pickers')
      .new({}, {
        prompt_title = 'Harpoon',
        finder = require('telescope.finders').new_table {
          results = file_paths,
        },
        previewer = conf.file_previewer {},
        sorter = conf.generic_sorter {},
      })
      :find()
end

vim.keymap.set('n', '<leader>hw', function()
  toggle_telescope(harpoon:list())
end, { desc = 'Open harpoon window' })

nmap('<leader>qh', '<cmd>cprev<cr>', 'Previous Quickfix')
nmap('<leader>ql', '<cmd>cnext<cr>', 'Next Quickfix')
nmap('<leader>qk', '<cmd>cnext<cr>', 'Quickfix Above')
nmap('<leader>qj', '<cmd>cnext<cr>', 'Quickfix Below')

-- nmap('<leader>m', '<cmd>MarkdownPreviewToggle<cr>', "[M]arkdown Preview Toggle")
wk.add({ '<leader>m', group = '[M]olten' })

vim.keymap.set("n", "<localleader>mI", ":MoltenInit<CR>",
  { desc = "Initialize the plugin" })
vim.keymap.set("n", "<localleader>mo", ":MoltenEvaluateOperator<CR>",
  { desc = "run operator selection" })
vim.keymap.set("n", "<localleader>ml", ":MoltenEvaluateLine<CR>",
  { desc = "evaluate line" })
vim.keymap.set("n", "<localleader>mc", ":MoltenReevaluateCell<CR>",
  { desc = "re-evaluate cell" })
vim.keymap.set("n", "<localleader>mA", ":MoltenReevaluateAll<CR>",
  { desc = "re-evaluate all" })
vim.keymap.set("v", "<localleader>mv", ":<C-u>MoltenEvaluateVisual<CR>gv",
  { desc = "evaluate visual selection" })
vim.keymap.set("n", "<localleader>md", ":MoltenDelete<CR>",
  { desc = "molten delete cell" })
vim.keymap.set("n", "<localleader>mh", ":MoltenHideOutput<CR>",
  { desc = "hide output" })
vim.keymap.set("n", "<localleader>mk", ":noautocmd MoltenEnterOutput<CR>",
  { desc = "show/enter output" })
vim.keymap.set("n", "<localleader>mj", ":MoltenNext<CR>",
  { desc = "next cell" })
vim.keymap.set("n", "<localleader>mk", ":MoltenPrev<CR>",
  { desc = "prev cell" })
vim.keymap.set("n", "<localleader>mi", ":MoltenImagePopup<CR>",
  { desc = "image popup" })

local dap_python = require("dap-python")

wk.add({ "<leader>d", group = "[D]ebug" })
vim.keymap.set("n", "<leader>dm", function()
    dap_python.test_method()
  end,
  { desc = "debug test method" }
)
vim.keymap.set("n", "<leader>dc", function()
    dap_python.test_class()
  end,
  { desc = "debug test class" }
)
vim.keymap.set("v", "<leader>ds", function()
    dap_python.debug_selection()
  end,
  { desc = "debug selection" }
)
-- nnoremap <silent> <leader>dn :lua require('dap-python').test_method()<CR>
-- nnoremap <silent> <leader>df :lua require('dap-python').test_class()<CR>
-- vnoremap <silent> <leader>ds <ESC>:lua require('dap-python').debug_selection()<CR>

local quarto_runner = require("quarto.runner")
vim.keymap.set("n", "<localleader>mrc", quarto_runner.run_cell, { desc = "run cell", silent = true })
vim.keymap.set("n", "<localleader>mra", quarto_runner.run_above, { desc = "run cell and above", silent = true })
vim.keymap.set("n", "<localleader>mrA", quarto_runner.run_all, { desc = "run all cells", silent = true })
vim.keymap.set("n", "<localleader>mrl", quarto_runner.run_line, { desc = "run line", silent = true })
vim.keymap.set("v", "<localleader>mr", quarto_runner.run_range, { desc = "run visual range", silent = true })
vim.keymap.set("n", "<localleader>mRA", function()
  quarto_runner.run_all(true)
end, { desc = "run all cells of all languages", silent = true })


local copilot_panel = require("copilot.panel")
vim.keymap.set("n",
  "<localleader>cpt",
  ":Copilot panel toggle",
  {
    desc = "Copilot toggle panel",
    silent = true
  }
)
