local function telescope_find_files(_)
  require("lvim.core.nvimtree").start_telescope("find_files")
end

local function telescope_live_grep(_)
  require("lvim.core.nvimtree").start_telescope("live_grep")
end

require("nvim-tree").setup({
  disable_netrw = true,
  hijack_netrw = true,
  sort_by = "name",
  on_config_done = nil,
  auto_reload_on_write = true,
  open_on_tab = false,
  hijack_cursor = true,
  diagnostics = {
    enable = true,
    show_on_dirs = false,
    icons = {
      hint = "",
      info = "",
      warning = "",
      error = "",
    },
  },
  view = {
    mappings = {
      list = {
        { key = { "l", "<CR>", "o" }, action = "edit", mode = "n" },
        { key = "h", action = "close_node" },
        { key = "v", action = "vsplit" },
        { key = "C", action = "cd" },
        { key = "gtf", action = "telescope_find_files", action_cb = telescope_find_files },
        { key = "gtg", action = "telescope_live_grep", action_cb = telescope_live_grep },
      },
    },
  },
  update_focused_file = {
    enable = true,
    update_cwd = false,
    update_root = false,
    ignore_list = {},
  },
  git = {
    enable = true,
    ignore = false,
    timeout = 200,
  },
  renderer = {
    indent_markers = {
      enable = false,
      icons = {
        corner = "└",
        edge = "│",
        item = "│",
        none = " ",
      },
    },
    icons = {
      -- webdev_colors = lvim.use_icons,
      -- show = {
      -- git = lvim.use_icons,
      -- folder = lvim.use_icons,
      -- file = lvim.use_icons,
      -- folder_arrow = lvim.use_icons,
      -- },
      glyphs = {
        default = "",
        symlink = "",
        git = {
          unstaged = "",
          staged = "S",
          unmerged = "",
          renamed = "➜",
          deleted = "",
          untracked = "U",
          ignored = "◌",
        },
        folder = {
          default = "",
          open = "",
          empty = "",
          empty_open = "",
          symlink = "",
        },
      },
    },
    highlight_git = true,
    root_folder_modifier = ":t",
  },
  actions = {
    use_system_clipboard = true,
    change_dir = {
      enable = true,
      global = false,
      restrict_above_cwd = false,
    },
    open_file = {
      quit_on_open = false,
      resize_window = false,
      window_picker = {
        enable = true,
        chars = "ABCDEFGHIJKLMNOPQRSTUVWXYZ1234567890",
        exclude = {
          filetype = { "notify", "packer", "qf", "diff", "fugitive", "fugitiveblame" },
          buftype = { "nofile", "terminal", "help" },
        },
      },
    },
  },
})
