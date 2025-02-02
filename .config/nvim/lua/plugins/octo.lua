return {
  "pwntester/octo.nvim",
  dependencies = {
    "nvim-lspconfig",
    "ibhagwan/fzf-lua",
  },
  opts = {
    use_local_fs = true,
    {
      suppress_missing_scope = {
        projects_v2 = true,
      },
    },
  },
}
