-- Read the docs: https://www.lunarvim.org/docs/configuration
-- Video Tutorials: https://www.youtube.com/watch?v=sFA9kX-Ud_c&list=PLhoH5vyxr6QqGu0i7tt_XoVK9v-KvZ3m6
-- Forum: https://www.reddit.com/r/lunarvim/
-- Discord: https://discord.com/invite/Xb9B4Ny%

-- vim global variables
vim.g.loaded_perl_provider = 0
vim.g.loaded_ruby_provider = 0

-- vim options
vim.opt.background = "dark"
vim.opt.cmdheight = 0
vim.opt.foldenable = false
vim.opt.foldexpr = "nvim_treesitter#foldexpr()"
vim.opt.foldmethod = "expr"
vim.opt.relativenumber = true
vim.opt.shiftwidth = 4
vim.opt.tabstop = 4
vim.opt.termguicolors = true

-- lunarvim settings
lvim.builtin.nvimtree.setup.filters.custom = {
    ".DS_Store",
    ".cache",
    ".git$",
    ".pytest_cache",
    "__pycache",
    "*.egg-info"
}
lvim.colorscheme = "gruvbox"
lvim.format_on_save.enabled = true
lvim.transparent_window = true
-- lvim.builtin.nvimtree.setup.git.enable = false

-- key-mappings
lvim.keys.normal_mode["<C-d>"] = "<C-d>zz"
lvim.keys.normal_mode["<C-u>"] = "<C-u>zz"

-- which-key-key-mappings
lvim.builtin.which_key.mappings["D"] = { "<cmd>DBUIToggle<cr>", "Dadbod UI" }
lvim.builtin.which_key.mappings["a"] = {
    name = "API Client",
    A = { "<cmd>HurlRunner<CR>", "Run All requests" },
    a = { "<cmd>HurlRunnerAt<CR>", "Run API request" },
    e = { "<cmd>HurlRunnerToEntry<CR>", "Run API request to entry" },
    t = { "<cmd>HurlToggleMode<CR>", "Hurl Toggle Mode" },
    V = { "<cmd>HurlVerbose<CR>", "Run Api in verbose mode" },
    -- Run Hurl request in visual mode
    v = { ":HurlRunner<CR>", "Hurl Runner", mode = "v" },
}
lvim.builtin.which_key.mappings["l"]["h"] = {
    function() vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled()) end,
    "Toggle Inlay Hints",
}
lvim.builtin.which_key.mappings["l"]["t"] = { "<cmd>ToggleDiag<cr>", "Toggle Diagnostics" }
lvim.builtin.which_key.mappings["m"] = { "<cmd>messages<cr>", "Messages" }
lvim.builtin.which_key.mappings["t"] = {
    name = "Neotest",
    T = { "<cmd>lua require('neotest').run.run()<cr>", "Run Test" },
    t = { "<cmd>lua require('neotest').run.run({strategy = 'dap'})<cr>", "Debug Test" },
    F = { "<cmd>lua require('neotest').run.run({vim.fn.expand('%')})<cr>", "Run Module" },
    f = { "<cmd>lua require('neotest').run.run({vim.fn.expand('%'), strategy = 'dap'})<cr>", "Debug Module" },
    s = { "<cmd>lua require('neotest').summary.toggle()<cr>", "Test Summary" },
    o = { "<cmd>lua require('neotest').output.open({ enter = true })<cr>", "Show Output" },
    O = { "<cmd>lua require('neotest').output_panel.toggle()<cr>", "Toggle Output" }
}

-- plugins
lvim.plugins = {
    {
        "klen/nvim-config-local",
        config = function()
            require("config-local").setup {
                config_files = { ".vimrc.lua", ".nvimrc", ".exrc" },
                hashfile = vim.fn.stdpath("data") .. "/config-local",
                autocommands_create = true, -- Create autocommands (VimEnter, DirectoryChanged)
                commands_create = true,     -- Create commands (ConfigLocalSource, ConfigLocalEdit, ConfigLocalTrust, ConfigLocalIgnore)
                silent = false,             -- Disable plugin messages (Config loaded/ignored)
                lookup_parents = false,     -- Lookup config files in parent directories
            }
        end
    },
    {
        "ellisonleao/gruvbox.nvim",
        priority = 1000
    },
    {
        "WhoIsSethDaniel/toggle-lsp-diagnostics.nvim",
        event = "BufEnter",
        config = function()
            require("toggle_lsp_diagnostics").init()
        end
    },
    {
        "nvim-neotest/neotest",
        lazy = true,
        dependencies = {
            { "nvim-neotest/neotest-python",     lazy = true },
            { "nvim-neotest/nvim-nio",           lazy = true },
            { "nvim-lua/plenary.nvim",           lazy = true },
            { "antoinemadec/FixCursorHold.nvim", lazy = true },
            { "nvim-treesitter/nvim-treesitter", lazy = true },
            { "mfussenegger/nvim-dap-python",    lazy = true }
        },
        config = function()
            require("neotest").setup({
                adapters = {
                    require("neotest-python")({
                        dap = {
                            justMyCode = false,
                            console = "integratedTerminal"
                        },
                        args = { "--log-level", "DEBUG" },
                        runner = "pytest",
                        pytest_discover_instances = true,
                    })
                }
            })
        end
    },
    {
        "mfussenegger/nvim-dap-python",
        config = function()
            require("dap-python").setup()
        end,
        lazy = true,
    },
    {
        'kristijanhusak/vim-dadbod-ui',
        dependencies = {
            {
                'tpope/vim-dadbod',
                lazy = true
            },
            {
                'kristijanhusak/vim-dadbod-completion',
                ft = { 'sql', 'mysql', 'plsql' },
                lazy = true
            },
        },
        cmd = {
            'DBUI',
            'DBUIToggle',
            'DBUIAddConnection',
            'DBUIFindBuffer',
        },
        config = function()
            -- Your DBUI configuration
            vim.g.db_ui_use_nerd_fonts = 1
        end,
    },
    {
        "jellydn/hurl.nvim",
        dependencies = { "MunifTanjim/nui.nvim", lazy = true },
        ft = "hurl",
        lazy = true,
        opts = {
            -- Show debugging info
            debug = false,
            -- Show notification on run
            show_notification = false,
            -- Show response in popup or split
            mode = "split",
            -- Default formatter
            formatters = {
                json = { 'jq' }, -- Make sure you have install jq in your system, e.g: brew install jq
                html = {
                    'prettier',  -- Make sure you have install prettier in your system, e.g: npm install -g prettier
                    '--parser',
                    'html',
                },
            },
        },
        config = function()
            require('hurl').setup()
        end,
    },
}

-- autocommands
lvim.autocommands = {
    { "Signal", { pattern = { "SIGUSR1" }, command = "LvimReload" } },
    { "ColorScheme",
        {
            callback = function()
                if vim.o.bg == 'dark' then
                    -- vim.cmd [[hi NeotestPassed guifg=#b8bb26]]
                    vim.cmd [[hi NeotestFailed guifg=#fb4934]]
                    -- vim.cmd [[hi NeotestRunning guifg=#268bd2]]
                    -- vim.cmd [[hi NeotestSkipped guifg=#2aa198]]
                    vim.cmd [[hi NeotestFile guifg=#b8bb26]] -- green
                    vim.cmd [[hi NeotestDir guifg=#83a598]]  -- blue
                    -- vim.cmd [[hi NeotestNamespace guifg=#d33682]]
                    -- vim.cmd [[hi NeotestFocused gui=bold,underline cterm=bold,underline]]
                    vim.cmd [[hi NeotestIndent guifg=#504945]]               -- bg2
                    vim.cmd [[hi NeotestExpandMarker guifg=#504945]]         -- bg2
                    vim.cmd [[hi NeotestAdapterName gui=bold guifg=#fb4934]] -- red
                    -- vim.cmd [[hi NeotestWinSelect guifg=#00f1f5 gui=bold]]
                    -- vim.cmd [[hi NeotestMarked guifg=#F79000 gui=bold]]
                    -- vim.cmd [[hi NeotestTarget guifg=#F70067]]
                    vim.cmd [[hi NeotestTest guifg=#d3869b]] -- purple
                else
                    -- vim.cmd [[hi NeotestPassed guifg=#79740e]]
                    vim.cmd [[hi NeotestFailed guifg=#9d0006]]
                    -- vim.cmd [[hi NeotestRunning guifg=#268bd2]]
                    -- vim.cmd [[hi NeotestSkipped guifg=#2aa198]]
                    vim.cmd [[hi NeotestFile guifg=#79740e]] -- green
                    vim.cmd [[hi NeotestDir guifg=#076678]]  -- blue
                    -- vim.cmd [[hi NeotestNamespace guifg=#d33682]]
                    -- vim.cmd [[hi NeotestFocused gui=bold,underline cterm=bold,underline]]
                    vim.cmd [[hi NeotestIndent guifg=#d5c4a1]]               -- bg2
                    vim.cmd [[hi NeotestExpandMarker guifg=#d5c4a1]]         -- bg2
                    vim.cmd [[hi NeotestAdapterName gui=bold guifg=#9d0006]] -- red
                    -- vim.cmd [[hi NeotestWinSelect guifg=#00f1f5 gui=bold]]
                    -- vim.cmd [[hi NeotestMarked guifg=#F79000 gui=bold]]
                    -- vim.cmd [[hi NeotestTarget guifg=#F70067]]
                    vim.cmd [[hi NeotestTest guifg=#8f3f71]] -- purple
                end
            end
        }
    },
}

-- filetypes
vim.filetype.add({
    extension = {
        hurl = "hurl",
    }
})

local ft = require('Comment.ft')
ft({ 'mysql', 'hurl', 'text' }, ft.get('sh'))
