call plug#begin()
" The default plugin directory will be as follows:
"   - Vim (Linux/macOS): '~/.vim/plugged'
"   - Vim (Windows): '~/vimfiles/plugged'
"   - Neovim (Linux/macOS/Windows): stdpath('data') . '/plugged'
" You can specify a custom plugin directory by passing it as the argument
"   - e.g. `call plug#begin('~/.vim/plugged')`
"   - Avoid using standard Vim directory names like 'plugin'

set nowrap

" Set how Vim formats text
set formatoptions-=t formatoptions-=c formatoptions-=r formatoptions-=o

" Set highlight search
set hlsearch

" Set split options
set splitbelow
set splitright

" Map split navigations
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" Map explore
nnoremap <C-E> :Explore<CR>

" Map terminal
map <Leader>t :term ++close bash<cr>
tmap <Leader>t <c-w>:term ++close bash<cr>

tmap <C-J> <C-W><C-J>
tmap <C-K> <C-W><C-K>
tmap <C-L> <C-W><C-L>
tmap <C-H> <C-W><C-H>

au BufNewFile,BufRead *.py
    \ set tabstop=4
    \ softtabstop=4
    \ shiftwidth=4
    \ textwidth=79
    \ expandtab
    \ autoindent
    \ fileformat=unix

au BufNewFile,BufRead *.js,*.jsx
    \ set tabstop=2
    \ softtabstop=2
    \ shiftwidth=2
    \ textwidth=79
    \ expandtab
    \ autoindent
    \ fileformat=unix

" Set encoding
set encoding=utf-8

" Set line numbers
set nu

Plug 'tmhedberg/SimpylFold'
" Set folding options
set foldmethod=indent
set foldlevel=99
" Map folding to spacebar
nnoremap <space> za

Plug 'vim-scripts/indentpython.vim'

Plug 'prettier/vim-prettier', { 'do': 'yarn install --frozen-lockfile --production' }

Plug 'Valloric/YouCompleteMe'
let g:ycm_autoclose_preview_window_after_completion=1

" Check syntax on save
Plug 'vim-syntastic/syntastic'

" Add PEP 8 checking
Plug 'nvie/vim-flake8'

let python_highlight_all=1
syntax on

Plug 'kien/ctrlp.vim'

" Add code commenting
Plug 'tpope/vim-commentary'

" Add code debugging
Plug 'puremourning/vimspector'
nnoremap <Leader>dd :call vimspector#Launch()<CR>
nnoremap <Leader>dr :call vimspector#Reset()<CR>
nnoremap <Leader>dc :call vimspector#Continue()<CR>

nnoremap <Leader>dt :call vimspector#ToggleBreakpoint()<CR>
nnoremap <Leader>dT :call vimspector#ClearBreakpoints()<CR>

nmap <Leader>h <Plug>VimspectorStepOut
nmap <Leader>j <Plug>VimspectorStepOver
nmap <Leader>k <Plug>VimspectorRestart
nmap <Leader>l <Plug>VimspectorStepInto

Plug 'sillybun/vim-repl'
let g:repl_python_auto_import = 0

" Initialize plugin system
" - Automatically executes `filetype plugin indent on` and `syntax enable`.
call plug#end()
" You can revert the settings after the call like so:
"   filetype indent off   " Disable file-type-specific indentation
"   syntax off            " Disable syntax highlighting

set t_Co=256
colorscheme codedark










