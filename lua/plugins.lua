vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
  -- Автоустановка пакетного менеджера
  use 'wbthomason/packer.nvim'

  ---------------------------------------------------------
  -- ПЛАГИНЫ ВНЕШНЕГО ВИДА
  ---------------------------------------------------------
  -- Тема в стиле Rose Pine
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
end)
