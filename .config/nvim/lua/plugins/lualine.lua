return {
  "nvim-lualine/lualine.nvim",
  opts = {
    options = {
      section_separators = { left = "", right = "" },
    },
    sections = {
      lualine_y = { "location" },
      lualine_z = { "progress" },
    },
  },
}
