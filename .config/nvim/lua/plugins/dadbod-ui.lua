return {
  {
    "kristijanhusak/vim-dadbod-ui",
    dependencies = {
      {
        "tpope/vim-dadbod",
        lazy = true,
      },
      {
        "kristijanhusak/vim-dadbod-completion",
        ft = { "sql", "mysql", "plsql" },
        lazy = true,
      },
    },
    cmd = {
      "DBUI",
      "DBUIToggle",
      "DBUIAddConnection",
      "DBUIFindBuffer",
    },
    config = function()
      -- Your DBUI configuration
      vim.g.db_ui_use_nerd_fonts = 1
    end,
  },
  --   {
  --     "hrsh7th/nvim-cmp",
  --     dependencies = {
  --       {
  --         "kristijanhusak/vim-dadbod-completion",
  --         ft = { "sql", "mysql", "plsql" },
  --         lazy = true,
  --       },
  --     },
  --     ---@param opts cmp.ConfigSchema
  --     opts = function(_, opts)
  --       table.insert(opts.sources, { name = "vim-dadbod-completion" })
  --     end,
  --   },
}
