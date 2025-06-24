-- You can add your own plugins here or in other files in this directory!
--  I promise not to create any merge conflicts in this directory :)
--
-- See the kickstart.nvim README for more information
--
return {
  {
    'epwalsh/obsidian.nvim',
    version = '*',
    lazy = true,
    ft = 'markdown',
    dependencies = {
      'nvim-lua/plenary.nvim',
    },
    opts = {
      workspaces = {
        {
          name = 'personal',
          path = '~/notes',
        },
      },
      ui = {
        enable = false,
      },
    },
  },
  {
    'klen/nvim-test',
    config = function()
      require('nvim-test').setup {}
    end,
  },
  {
    'iamcco/markdown-preview.nvim',
    cmd = { 'MarkdownPreviewToggle', 'MarkdownPreview', 'MarkdownPreviewStop' },
    ft = { 'markdown' },
    build = function()
      vim.fn['mkdp#util#install']()
    end,
  },
  -- 'bullets-vim/bullets.vim',
  {
    'ThePrimeagen/harpoon',
    branch = 'harpoon2',
    dependencies = { 'nvim-lua/plenary.nvim' },
  },
  {
    'stevearc/conform.nvim',
    opts = {},
  },
  'jay-babu/mason-nvim-dap.nvim',
  {
    'GCBallesteros/jupytext.nvim',
    config = function()
      require("jupytext").setup({
        style = "markdown",
        output_extension = "md",
        force_ft = "markdown"
      })
    end,
  },
  -- plugins/quarto.lua
  {
    "quarto-dev/quarto-nvim",
    dependencies = {
      "jmbuhr/otter.nvim",
      "nvim-treesitter/nvim-treesitter",
    },
    ft = { "quarto", "markdown" }
  },
  {
    'zbirenbaum/copilot.lua',
    cmd = 'Copilot',
    config = function()
      require('copilot').setup {
        panel = {
          enabled = true,
          auto_refresh = false,
          keymap = {
            jump_prev = '[[',
            jump_next = ']]',
            accept = '<CR>',
            refresh = 'gr',
            open = '<M-CR>',
          },
          layout = {
            position = 'left', -- | top | left | right | horizontal | vertical
            ratio = 0.4,
          },
        },
        suggestion = {
          enabled = true,
          auto_trigger = false, -- true
          trigger_on_accept = true,
          keymap = {
            accept = '<C-l>',
            accept_word = false,
            accept_line = false,
            next = '<M-]>',
            prev = '<M-[>',
            dismiss = '<C-]>',
          },
        },
      }
    end,
  },
  {
    'stevearc/oil.nvim',
    ---@module 'oil'
    ---@type oil.SetupOpts
    opts = {
      view_options = {
        show_hidden = true,
        ---@diagnostic disable-next-line: unused-local
        is_always_hidden = function(name, bufnr)
          return false
        end,
      },
    },
    -- Optional dependencies
    dependencies = { { 'echasnovski/mini.icons', opts = {} } },
    -- dependencies = { "nvim-tree/nvim-web-devicons" }, -- use if you prefer nvim-web-devicons
    -- Lazy loading is not recommended because it is very tricky to make it work correctly in all situations.
    lazy = false,
  },
  {
    'benlubas/molten-nvim',
    dependencies = {
      {
        '3rd/image.nvim',
        build = false,
        config = function()
          require('image').setup {
            -- processor = 'magick-cli',
            backend = 'kitty',                        -- Kitty will provide the best experience, but you need a compatible terminal
            integrations = {},                        -- do whatever you want with image.nvim's integrations
            max_width = 100,                          -- tweak to preference
            max_height = 12,                          -- ^
            max_height_window_percentage = math.huge, -- this is necessary for a good experience
            max_width_window_percentage = math.huge,
            window_overlap_clear_enabled = true,
            window_overlap_clear_ft_ignore = { 'cmp_menu', 'cmp_docs', '' },
          }
        end,
      },
    },
  },
  "mfussenegger/nvim-dap-python",
  -- {
  --   "kndndrj/nvim-dbee",
  --   dependencies = {
  --     "MunifTanjim/nui.nvim",
  --   },
  --   build = function()
  --     -- Install tries to automatically detect the install method.
  --     -- if it fails, try calling it with one of these parameters:
  --     --    "curl", "wget", "bitsadmin", "go"
  --     require("dbee").install()
  --   end,
  --   config = function()
  --     require("dbee").setup( --[[optional config]])
  --   end,
  --   {
  --     'rmagatti/auto-session',
  --     lazy = false,
  --
  --     ---enables autocomplete for opts
  --     ---@module "auto-session"
  --     ---@type AutoSession.Config
  --     opts = {
  --       suppressed_dirs = { '~/', '~/Projects', '~/Downloads', '/' },
  --       -- log_level = 'debug',
  --     }
  --   }
  -- },
}
