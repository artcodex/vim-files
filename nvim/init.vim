call plug#begin('~/.vim/plugged')

Plug 'ryanoasis/vim-devicons'
Plug 'junegunn/vim-easy-align'
Plug 'critiqjo/lldb.nvim'
" Plug 'rip-rip/clang_complete'
" Plug 'Shougo/denite.nvim'
Plug 'kien/ctrlp.vim'
Plug 'bling/vim-airline'
Plug 'tpope/vim-fugitive'
Plug 'jreybert/vimagit'
Plug 'scrooloose/nerdtree'
Plug 'neomake/neomake'
Plug 'tpope/vim-surround'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'easymotion/vim-easymotion'
Plug 'octol/vim-cpp-enhanced-highlight'
Plug 'justinmk/vim-syntax-extra'
Plug 'vim-scripts/Conque-GDB'
Plug 'tikhomirov/vim-glsl'

call plug#end()
let g:python_host_prog = '/usr/bin/python'

let g:current_color_scheme = 0
source ~/.config/nvim/monokai.vim


" NERDTree config
" autocmd StdinReadPre * let s:std_in=1
" autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
" autocmd vimenter * NERDTree
" autocmd vimenter * wincmd p
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
map <C-n> :NERDTreeToggle<CR>
map <C-b> :CtrlP<CR>
let g:clang_library_path='/Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/lib/'
set encoding=utf8
set guifont=Droid\ Sans\ Mono\ for\ Powerline\ Nerd\ Font\ Complete:h11

let g:cpp_class_scope_highlight = 1
let g:cpp_experimental_template_highlight = 1

highlight LineNr term=bold cterm=NONE ctermfg=DarkGrey ctermbg=NONE gui=NONE guifg=DarkGrey guibg=NONE
set relativenumber number 
set cul

set foldmethod=indent   "fold based on syntax
set foldnestmax=10      "deepest fold is 10 levels
set nofoldenable        "dont fold by default
set foldlevel=1         "this is just what i use

let g:airline_powerline_fonts = 1

map <Bar> <C-w>v<C-w><Right>
map - <C-w>s<C-w><Down>
map <Tab> <C-w>w
map k <C-w>o
map ; :tabnew<CR>
map [ :tabp<CR>
map ] :tabn<CR>
map m :tabo<CR>

function! Chomp(string)
    return substitute(a:string, '\"', '', 'g')
endfunction

fun! SaveSession( arg ) "{{{
	let s:nstr = Chomp(a:arg)
	let s:cmd = "mksession ~/vimsessions/" . s:nstr . ".vim"
	echo s:cmd
    	execute s:cmd

    " Do something with your arg here
endfunction "}}}

fun! SwitchColors() "{{{
	if (g:current_color_scheme == 0) 
		let g:current_color_scheme = 1
		source ~/.config/nvim/Tomorrow-Night-Blue.vim
	else
		let g:current_color_scheme = 0
		source ~/.config/nvim/monokai.vim
	endif
endfunction "}}}

fun! RestoreSession( arg ) "{{{
	let s:nstr = Chomp(a:arg)
	let s:cmd = "source ~/vimsessions/" . s:nstr . ".vim"
	echo s:cmd
    	execute s:cmd

    " Do something with your arg here
endfunction "}}}

command! -nargs=1 Ss call SaveSession( '<f-args>' )
command! -nargs=1 Rs call RestoreSession( '<f-args>' )

" Themes
command! -nargs=0 Sc call SwitchColors()

