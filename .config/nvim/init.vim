set nocompatible              " be iMproved, required
filetype off                  " required

set number

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'
Plugin 'ycm-core/YouCompleteMe'
Plugin 'sheerun/vim-polyglot'
Plugin 'ap/vim-css-color' 
Plugin 'tpope/vim-fugitive'
Plugin 'scrooloose/nerdtree'
Plugin 'scrooloose/syntastic'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'dracula/vim', { 'name': 'dracula' }
Plugin 'flazz/vim-colorschemes'
Plugin 'sainnhe/sonokai'
Plugin 'vim-airline/vim-airline'
Plugin 'mhinz/vim-startify'
Plugin 'tiagofumo/vim-nerdtree-syntax-highlight'
Plugin 'ryanoasis/vim-devicons'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this liner FAQ
"
" 
set runtimepath^=~/.vim runtimepath+=~/.vim/after
let &packpath = &runtimepath
map <C-n> :NERDTreeToggle<CR>

"This unsets the "last search pattern" register by hitting return
nnoremap <CR> :noh<CR><CR>
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

"Shortcutting split navigation, saving a keypress:
map <C-h> <C-w>h
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l

"Replace all is aliased to S.
nnoremap S :%s//g<Left><Left>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Splits and Tabbed Files
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set splitbelow splitright

set path+=**					" Searches current directory recursively.
set wildmenu					" Display all matches when tab complete.
set incsearch
set clipboard^=unnamed,unnamedplus

let g:html_indent_tags = 'li\|p'
let g:minimap_highlight='Visual'
let g:syntastic_java_checkers = []

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Startify
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""                                                                                               
let g:startify_files_number = 10
let g:startify_bookmarks = [ {'b': '~/.config/bspwm/bspwmrc'}, {'p': '~/.config/polybar/config'}, {'n': '~/.config/nvim/init.vim'}, {'r': '~/.config/rofi/theme.rasi'}, {'x': '~/.config/sxhkd/sxhkdrc'}, {'k': '~/.config/kitty/kitty.conf'}, {'f': '~/.config/neofetch/config'} ]
let g:startify_lists = [                                                                             
  \ { 'type': 'bookmarks',       'header': ['	.dotfiles:'] }, 
  \ { 'type': 'files',     'header': ['	recently used files:'] },                          
  \ { 'type': 'sessions',  'header': ['   Saved sessions:'] },                                       
  \ ]                                                                                                
let g:startify_update_oldfiles = 1                                                                   
                                                                                                     
" Position nerdtree on the right (rather than the left)                                              
let g:sidebar_direction = ''                                                                         
let g:NERDTreeWinPos=get(g:,'NERDTreeWinPos',sidebar_direction)                                      
                                                                                                     
" Open Startify and NERDTree automatically when vim starts up if no files were specified             
" autocmd VimEnter * if !argc() | Startify | NERDTree | winc h | endif                                 
                                                                                                     
" Make is so that you can close vim if the only window left open is a NERDTree                       
" autocmd bufenter * if winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif


" Let clangd fully control code completion
let g:ycm_clangd_uses_ycmd_caching = 0
" Use installed clangd, not YCM-bundled clangd which doesn't get updates.
let g:ycm_clangd_binary_path = exepath("clangd")

syntax on

"colorscheme space-vim-dark
"hi Normal     ctermbg=NONE
"hi LineNr     ctermbg=NONE
"hi SignColumn ctermbg=NONE
"hi Comment ctermfg=59

if (has("termguicolors"))
  set termguicolors
endif

" the configuration options should be placed before `colorscheme sonokai`
set noshowmode
let g:sonokai_style = 'shusia' " 'shusia' 'andromeda' 'atlantis' 'maia'
let g:sonokai_enable_italic = 1
let g:sonokai_disable_italic_comment = 1
let g:sonokai_transparent_background = 1
let g:airline_theme = 'sonokai'
colorscheme sonokai
