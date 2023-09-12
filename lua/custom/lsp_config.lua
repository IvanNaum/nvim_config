local on_attach = function(client, bufnr)
  vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, {})
  vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, {})

  vim.keymap.set("n", "gd", vim.lsp.buf.defenition, {})
  vim.keymap.set("n", "gr", vim.lsp.buf.implementation, {})
  -- vim.keymap.set('n', 'gr', require('telescope.builtin').lsp_references, {})
  vim.keymap.set("n", "K", vim.lsp.buf.hover, {})

  client.resolved_capabilities.document_formatting = false
  vim.api.nvim_buf_set_keymap(bufnr, "n", "<space>fm", "<cmd>lua vim.lsp.buf.formatting()<CR>", {})
end
local capabilities = require("cmp_nvim_lsp").default_capabilities()

require("mason").setup()
require("mason-lspconfig").setup({
  ensure_installed = {
    "lua_ls", -- Lua

    "cmake",  -- Cmake
    "clangd", -- C/C++
    -- "clang-format",

    "pyright",               -- Python

    "html",                  -- HTML
    "emmet_language_server", -- Emmet
    -- TODO CSS
    "tailwindcss",           -- Tailwind CSS
  },
})

require("mason-null-ls").setup({
  ensure_installed = { "stylua", "clang_format" },
})

require("mason-lspconfig").setup_handlers({
  function(server_name)
    require("lspconfig")[server_name].setup({
      on_attach = on_attach,
      capabilities = capabilities,
    })
  end,
  -- Для изменения дефолтных конфигураций
  -- ["tsserver"] = function()
  -- end,
})
