"""""""""""""""""""""""""""""""""""""""
"Maintainer:
"	Andrej Chikilev
"	andrej.chikilev@gmail.com
"
"Version 1.1 - 26/02/18
"
"
"
"Sections:
"	-> General
"	-> Vim UI
"	-> Plugins settings
"	-> KeyBindings
"	-> Encoding
"	-> Colors and Fonts
"   -> Addons
"""""""""""""""""""""""""""""""""""""""



"""""""""""""""""""""""""""""""""""""""
" => General
"""""""""""""""""""""""""""""""""""""""
"Отключить совместимость с Vi
set nocompatible

" Количество операций, которые помнит Vim 
set history=700

" Включить автообновление открытого файла, измененного извне
set autoread

" количество символов пробела, которые будут заменять \t
set tabstop=4
set expandtab
set shiftwidth=4
set softtabstop=4
set smarttab

" Автоизменение длины табуляции от типа файла
if has("autocmd")
    filetype on
    autocmd FileType python setlocal ts=4 sts=4 sw=4 et
    autocmd FileType javascript setlocal ts=4 sts=4 sw=4 et
    autocmd FileType html setlocal ts=2 sts=2 sw=2 et
    autocmd FileType htmldjango setlocal ts=2 sts=2 sw=2 et
    autocmd FileType xhtml setlocal ts=2 sts=2 sw=2 et
    autocmd FileType xml setlocal ts=2 sts=2 sw=2 et
    autocmd FileType css setlocal ts=2 sts=2 sw=2 et
    autocmd FileType vim setlocal ts=4 sts=4 sw=4 et
    autocmd FileType apache setlocal ts=2 sts=2 sw=2 et
    autocmd FileType yaml setlocal ts=2 sts=2 sw=2 et

    autocmd BufNewFile,BufRead *.tmpl,*.tpl setfiletype html
endif

" автозамена
set et 

" Автоперенос длинных строк
set wrap

"""""""""""""""""""""""""""""""""""""""
" => Vim UI
"""""""""""""""""""""""""""""""""""""""
" Задание типа терминала
set term=xterm

" Задание 256 цветового режима
set t_Co=256

" Всегда показывать текущую позицию 
set ruler

" Включить нумерацию строк
set number

" Отключить нумерацию строк
"set nonumber

" Настройка Airline statusbar
let g:airline#extensions#tabline#enabled = 1
let g:airline_powerline_fonts = 1

"""""""""""""""""""""""""""""""""""""""
" => Plugins settings
"""""""""""""""""""""""""""""""""""""""

"" EasyTags
"=====================================
" Путь для файла с тегами
let g:easytags_file = '~/.vim/tags'

" Отключаем автоподсветку тегов
let g:easytags_auto_highlight = 0

let g:easytags_events = ['BufWritePost']

" Не блокировать Vim во время записи тегов
let g:easytags_async = 1

"" Python-mode settings
"=====================================
" отключаем автокомплит по коду (у нас вместо него используется jedi-vim)
let g:pymode_rope = 0
let g:pymode_rope_completion = 0
let g:pymode_rope_complete_on_dot = 0

" документация
let g:pymode_doc = 0
let g:pymode_doc_key = 'K'
" проверка кода
let g:pymode_lint = 1
let g:pymode_lint_checker = "pyflakes,pep8"
let g:pymode_lint_ignore="E501,W601,C0110"
" провека кода после сохранения
let g:pymode_lint_write = 1

" поддержка virtualenv
let g:pymode_virtualenv = 1

" установка breakpoints
let g:pymode_breakpoint = 1
let g:pymode_breakpoint_key = '<leader>b'

" подстветка синтаксиса
let g:pymode_syntax = 1
let g:pymode_syntax_all = 1
let g:pymode_syntax_indent_errors = g:pymode_syntax_all
let g:pymode_syntax_space_errors = g:pymode_syntax_all

" отключить autofold по коду
let g:pymode_folding = 0

" возможность запускать код
let g:pymode_run = 0

"" Jedi-vim
"======================================
" Disable choose first function/method at autocomplete
let g:jedi#popup_select_first = 1
" Automatically close preview window upon leaving insert mode
let g:jedi#auto_close_doc = 1


"""""""""""""""""""""""""""""""""""""""
" => KeyBindings
"""""""""""""""""""""""""""""""""""""""
let mapleader = ","

" Управление NerdTree
map <F8> :NERDTreeToggle<cr>
map <leader>nn :NERDTreeToggle<cr>
map <leader>nb :NERDTreeFromBookmark 
map <leader>nf :NERDTreeFind<cr>

" Управление TagBar
map <F4> :TagbarToggle<cr>
let g:tagbar_autofocus = 0 "Автофокус на TagBar при открытии

" Управление TagList
map <F3> :TlistToggle<cr>

" Управление вкладками
map <leader>tn :tabnew<cr>
map <leader>to :tabonly<cr>
map <leader>tc :tabclose<cr>
map <leader>tm :tabmove<cr>
map <leader>tl :tabnext<cr>
map <leader>th :tabprevious<cr>

"Управление буферами
map <leader>bn :MBEbn<cr>
map <leader>bp :MBEbp<cr>

"""""""""""""""""""""""""""""""""""""""
" => Encoding
"""""""""""""""""""""""""""""""""""""""
" Установка кодировки по умолчанию Utf-8
set encoding=utf-8

"""""""""""""""""""""""""""""""""""""""
" => Colors and fonts
"""""""""""""""""""""""""""""""""""""""
" Включить подсветку синтаксиса
syntax enable

"Цветовая схема
colorscheme desert
set background=dark

""""""""""""""""""""""""""""""""""""""""
" => Addons
""""""""""""""""""""""""""""""""""""""""
" Включить pathogen-vim https://github.com/tpope/vim-pathogen
"execute pathogen#infect()
"syntax on
"filetype plugin indent on



" Включить Vundle
set nocompatible
filetype off
set rtp+=~/.vim/bundle/Vundle.vim

call vundle#begin()

Plugin 'VundleVim/Vundle.vim'

" plugin on GitHub repo
Plugin 'ervandew/supertab'
Plugin 'garbas/vim-snipmate'
Plugin 'scrooloose/nerdtree'            "Project and file navigation
Plugin 'majutsushi/tagbar'              "Class/module browser
Plugin 'scrooloose/syntastic'
Plugin 'jiangmiao/auto-pairs'
Plugin 'scrooloose/nerdcommenter'
Plugin 'mbbill/undotree'
Plugin 'marcweber/vim-addon-mw-utils'
Plugin 'tomtom/tlib_vim'
Plugin 'vim-airline/vim-airline'        "Vim statusbar
Plugin 'vim-airline/vim-airline-themes'
Plugin 'rosenfeld/conque-term'      "Consoles as buffers
Plugin 'joonty/vdebug'                  "Debugger client for Vim
Plugin 'xolox/vim-misc'
Plugin 'xolox/vim-easytags'
Plugin 'MattesGroeger/vim-bookmarks' 
"Plugin 'vim-scripts/Conque-GDB'

" plugin from http://vim-scripts.org/vim/scripts.html
Plugin 'c.vim'
Plugin 'gdbmgr'
Plugin 'minibufexpl.vim'
Plugin 'netrw.vim'
Plugin 'taglist.vim'

"---------------=== Languages support ===-------------
"" --- Python ---
Plugin 'klen/python-mode'               "Python mode (docs, refactor, lints, highlighting, refactorun and ipdb and more)
Plugin 'davidhalter/jedi-vim'           "Jedi-vim autocomplete plugin
Plugin 'mitsuhiko/vim-jinja'            "Jinja support for vim
Plugin 'mitsuhiko/vim-python-combined'  "Combined Python 2/3 for Vim
Plugin 'fs111/pydoc.vim'

"" --- CSS ---
Plugin 'mtscout6/vim-tagbar-css'
call vundle#end()
filetype plugin indent on

