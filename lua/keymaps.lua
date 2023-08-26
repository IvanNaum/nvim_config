local map = vim.api.nvim_set_keymap
local default_opts = {noremap = true, silent = true}
-----------------------------------------------------------
-- НАВИГАЦИЯ
-----------------------------------------------------------
-- Отключаем стрелочки в Нормальном Режиме. Хардкор!
map('', '<up>', ':echoe "Use hjkl, bro, only hardcore"<CR>', {noremap = true, silent = false})
map('', '<down>', ':echoe "Use hjkl, bro, only hardcore"<CR>', {noremap = true, silent = false})
map('', '<left>', ':echoe "Use hjkl, bro, only hardcore"<CR>', {noremap = true, silent = false})
map('', '<right>', ':echoe "Use hjkl, bro, only hardcore"<CR>', {noremap = true, silent = false})
-- <F5> разные вариации нумераций строк, можно переключаться на ходу
map('n', '<F5>', ':exec &nu==&rnu? "se nu!" : "se rnu!"<CR>', default_opts)


-----------------------------------------------------------
-- РЕЖИМЫ
-----------------------------------------------------------
-- Выходим в нормальный режим через <jk>, чтобы не тянуться
map('i', 'jk', '<Esc>', {noremap = true})
-----------------------------------------------------------
