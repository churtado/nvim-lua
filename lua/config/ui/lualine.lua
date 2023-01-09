-- local custom_gruvbox_material = require("lualine.themes.gruvbox-material")

local colors = {
  fg1 = "#282828", -- color of the text that displays the MODE
  color2 = "#504945",
  fg2 = "#d7af87", -- color of the rest of the text
  color3 = "#32302f",
  color4 = "#a89984", -- bg color of the MODE section
  color5 = "#7daea3",
  color6 = "#a9b665",
  color7 = "#d8a657",
  color8 = "#d3869b",
  color9 = "#ea6962",
}

require("lualine").setup({
  options = {
    icons_enabled = true,
    -- theme = custom_gruvbox_material,
    theme = {
      normal = {
        a = { fg = colors.fg1, bg = colors.color4, gui = "bold" },
        b = { fg = colors.fg2, bg = colors.color2 },
        c = { fg = colors.fg2, bg = colors.color3 },
      },
      command = { a = { fg = colors.fg1, bg = colors.color5, gui = "bold" } },
      inactive = { a = { fg = colors.fg2, bg = colors.color2 } },
      insert = { a = { fg = colors.fg1, bg = colors.color6, gui = "bold" } },
      replace = { a = { fg = colors.fg1, bg = colors.color7, gui = "bold" } },
      terminal = { a = { fg = colors.fg1, bg = colors.color8, gui = "bold" } },
      visual = { a = { fg = colors.fg1, bg = colors.color9, gui = "bold" } },
    },
    component_separators = { left = "", right = "" },
    section_separators = { left = "", right = "" },
    disabled_filetypes = {
      statusline = {},
      winbar = {},
    },
    ignore_focus = {},
    always_divide_middle = true,
    globalstatus = false,
    refresh = {
      statusline = 1000,
      tabline = 1000,
      winbar = 1000,
    },
  },
  sections = {
    lualine_a = { "mode" },
    lualine_b = { "branch", "diff", "diagnostics" },
    lualine_c = { "filename" },
    lualine_x = { "encoding", "fileformat", "filetype" },
    lualine_y = { "progress" },
    lualine_z = { "location" },
  },
  inactive_sections = {
    lualine_a = {},
    lualine_b = {},
    lualine_c = { "filename" },
    lualine_x = { "location" },
    lualine_y = {},
    lualine_z = {},
  },
  tabline = {},
  winbar = {},
  inactive_winbar = {},
  extensions = {},
})
