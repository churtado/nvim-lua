local nls = require("null-ls")
local augroup = vim.api.nvim_create_augroup("LspFormatting", {})

nls.setup({
  sources = {
    debug = true,
    nls.builtins.code_actions.gitsigns,
    nls.builtins.code_actions.shellcheck,
    nls.builtins.diagnostics.eslint_d,
    nls.builtins.diagnostics.vale,
    nls.builtins.formatting.black,
    -- nls.builtins.formatting.eslint_d,
    -- nls.builtins.formatting.eslint_d.with({
    --   command = "eslint_d",
    --   extra_args = { "--fix-to-stdout", "--stdin", "stdin-filename", "$FILENAME" },
    --   filetypes = { "javascript", "javascriptreact", "typescript", "typescriptreact" },
    -- }),
    -- nls.builtins.formatting.latexindent.with({
    --   extra_args = { "-g", "/dev/null" }, -- https://github.com/cmhughes/latexindent.pl/releases/tag/V3.9.3
    -- }),
    -- nls.builtins.formatting.prettier.with({
    -- 	extra_args = { "--single-quote", "true" },
    -- }),
    nls.builtins.formatting.stylua.with({ extra_args = { "--indent-type", "Spaces", "--indent-width", "2" } }),
    -- nls.builtins.formatting.terraform_fmt,
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
          -- if AUTOFORMAT_ACTIVE then -- global var defined in functions.lua
          vim.lsp.buf.format({ bufnr = bufnr })
          -- end
        end,
      })
    end
  end,
})
