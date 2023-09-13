vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
  -- Автоустановка пакетного менеджера
  use 'wbthomason/packer.nvim'

  ---------------------------------------------------------
  -- ПЛАГИНЫ ВНЕШНЕГО ВИДА
  ---------------------------------------------------------
  -- Информационная строка внизу
  use "kyazdani42/nvim-web-devicons"
  use { 'nvim-lualine/lualine.nvim',
    requires = { 'kyazdani42/nvim-web-devicons', opt = true },
    config = function()
      require('lualine').setup()
    end,
  }
  -- Тема
  use({
    'NLKNguyen/papercolor-theme',
    as = 'papercolor-theme',
    config = function()
      vim.cmd('set t_Co=256')
      vim.cmd('set background=dark')
      vim.cmd('colorscheme PaperColor')
    end
  })


  ---------------------------------------------------------
  -- МОДУЛИ РЕДАКТОРА
  ---------------------------------------------------------
  -- автоматические закрывающиеся скобки
  use { 'windwp/nvim-autopairs',
    config = function()
      require("nvim-autopairs").setup()
    end,
  }
  use { 'numToStr/Comment.nvim',
    config = function()
      require('Comment').setup()
    end
  }

  ---------------------------------------------------------
  -- LSP И АВТОДОПОЛНЯЛКИ
  ---------------------------------------------------------
  -- LSP
  use {
    "williamboman/mason.nvim",
    "williamboman/mason-lspconfig.nvim",
    "neovim/nvim-lspconfig",
  }
  -- Autocomplete
  use {
    'hrsh7th/nvim-cmp',
    'hrsh7th/cmp-nvim-lsp',
    'hrsh7th/cmp-buffer',
    -- Автодополнлялка к файловой системе
    'hrsh7th/cmp-path',
    'L3MON4D3/LuaSnip',
  }
  -- Formatter
  use({
    "jose-elias-alvarez/null-ls.nvim",
    -- config = function()
    --     require("null-ls").setup()
    -- end,
    requires = { "nvim-lua/plenary.nvim" },
  })
  use { "jay-babu/mason-null-ls.nvim" }
  -- DAP
  use {
    "rcarriga/nvim-dap-ui",
    requires = { "mfussenegger/nvim-dap" }
  }

  ---------------------------------------------------------
  -- РАЗНОЕ
  ---------------------------------------------------------
  -- Даже если включена русская раскладка, то nvim-команды будут работать
  use 'powerman/vim-plugin-ruscmd'
end)
