local null_ls = require("null-ls")
local augroup = vim.api.nvim_create_augroup("LspFormatting", {})

null_ls.setup({
  sources = {
    debug = true,
    null_ls.builtins.code_actions.gitsigns,
    null_ls.builtins.code_actions.shellcheck,
    null_ls.builtins.diagnostics.eslint,
    null_ls.builtins.formatting.eslint_d,
    -- null_ls.builtins.diagnostics.vale,
    -- null_ls.builtins.formatting.black,
    -- null_ls.builtins.formatting.prettier,
    -- null_ls.builtins.formatting.prettierd.with({
    --   extra_args = {
    --     "--use-tabs=true",
    --     "--trailingComma=none",
    --     "--single-quote=true",
    --   },
    -- }),
    -- NOTE: it works but the buffer doesn't refresh. Use :e after saving
    null_ls.builtins.formatting.rubocop.with({
      command = "rubocop",
      extra_args = {
        "--auto-correct",
      },
    }),
    null_ls.builtins.formatting.rustfmt.with({}),
    null_ls.builtins.formatting.stylua.with({ extra_args = { "--indent-type", "Spaces", "--indent-width", "2" } }),
  },
  on_attach = function(client, bufnr)
    local wk = require("which-key")
    local default_options = { silent = true }
    wk.register({
      m = {
        F = { "<cmd>lua require('config.lsp.utils').toggle_autoformat()<cr>", "Toggle format on save" },
      },
    }, { prefix = "<leader>", mode = "n", default_options })
    if client.supports_method("textDocument/formatting") then
      vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
      vim.api.nvim_create_autocmd("BufWritePre", {
        group = augroup,
        buffer = bufnr,
        callback = function()
          if AUTOFORMAT_ACTIVE then -- global var defined in functions.lua
            vim.lsp.buf.format({ bufnr = bufnr, timeout_ms = 2000 })
          end
        end,
      })
    end
  end,
})
