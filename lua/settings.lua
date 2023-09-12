local opt = vim.opt

---------------------------------------------------------
-- ОБЩИЕ ОПЦИИ
---------------------------------------------------------
opt.mouse = 'a'              --Включит мышь
opt.encoding = 'utf-8'       --Кодировка 
opt.showcmd = true           --Отображение команд 
vim.cmd([[
filetype indent plugin on
syntax enable
]])
opt.swapfile = false --Не создаем свап файлы
vim.o.t_Co="256"

---------------------------------------------------------
---- ВИЗУАЛЬНЫЕ ОПЦИИ 
---------------------------------------------------------
opt.number = true            --Номер строк сбоку 
opt.relativenumber = true    --Относительная нумерация 
opt.wrap = true              --Длинные линии будет видно 
opt.expandtab = true         --??? 
opt.tabstop = 4              --1 tab = 4 пробела 
opt.smartindent = true
opt.shiftwidth = 4           --Смещаем на 4 пробела

-- 2 spaces for selected filetypes
vim.cmd([[
autocmd FileType xml,html,xhtml,css,scss,javascript,lua,yaml,htmljinja setlocal shiftwidth=2 tabstop=2
]])

opt.so = 7                   --Отступ курсора от края экрана 
opt.foldcolumn = '0'         --Ширина колонки для фолдов 
opt.colorcolumn =  '79'     --Расположение цветной колонки

-- remove line lenght marker for selected filetypes
vim.cmd([[
autocmd FileType text,markdown,html,xhtml,javascript setlocal cc=0
]])


----------------------------------------------------------- 
-- НАСТРОЙКИ ФАЙЛОВОГО МЕНЕДЖЕРА
----------------------------------------------------------- 
vim.g.netrw_banner = false -- hide banner above files
vim.g.netrw_liststyle = 3 -- tree instead of plain view
vim.g.netrw_browse_split = 3 -- vertical split window when Enter pressed on file

-----------------------------------------------------------
-- НАСТРОЙКИ ПОИСКА
-----------------------------------------------------------
-- Будет игнорировать размер букв при поиске
opt.ignorecase = true        --Игнорировать размер букв
opt.smartcase = true         --Игнор прописных букв

-----------------------------------------------------------
-- ПОЛЕЗНЫЕ ФИШКИ
-----------------------------------------------------------
-- Подсвечивает на доли секунды скопированную часть текста
vim.api.nvim_exec([[
augroup YankHighlight
autocmd!
autocmd TextYankPost * silent! lua vim.highlight.on_yank{higroup="IncSearch", timeout=150}
augroup end
]], false)
