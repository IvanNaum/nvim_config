local on_attach = function (_, _)
  vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename, {})
  vim.keymap.set('n', '<leader>ca', vim.lsp.buf.code_action, {})

  vim.keymap.set('n', 'gd', vim.lsp.buf.defenition, {})
  vim.keymap.set('n', 'gr', vim.lsp.buf.implementation, {})
  -- vim.keymap.set('n', 'gr', require('telescope.builtin').lsp_references, {})
  vim.keymap.set('n', 'K', vim.lsp.buf.hover, {})
end
local capabilities = require('cmp_nvim_lsp').default_capabilities()


require("mason").setup()
require("mason-lspconfig").setup {
    ensure_installed = {
      "lua_ls", -- Lua 

      "cmake", -- Cmake 
      "clangd", -- C/C++ 

      "pyright", -- Python 

      "html", -- HTML 
      "emmet_language_server", -- Emmet  
      -- TODO CSS
      "tailwindcss", -- Tailwind CSS  
    },
}
require("lspconfig").pyright.setup {}

require("mason-lspconfig").setup_handlers {
    function (server_name)
       require("lspconfig")[server_name].setup {
         on_attach=on_attach,
         capabilities=capabilities
       }
    end,


    -- Для изменения дефолтных конфигураций
    -- ["rust_analyzer"] = function ()
    --     require("rust-tools").setup {}
    -- end
}


