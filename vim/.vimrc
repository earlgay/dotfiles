""" Vundle PluginsP

set nocompatible              " be iMproved, required
filetype off                  " required
" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'VundleVim/Vundle.vim'
Plugin 'tpope/vim-fugitive'
Plugin 'justinmk/vim-sneak'
Plugin 'preservim/nerdtree'
Plugin 'vim-syntastic/syntastic'
Plugin 'prettier/vim-prettier'
"Plugin 'morhetz/gruvbox'
Plugin 'tomasiser/vim-code-dark'
Plugin 'mbbill/undotree'
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'preservim/nerdcommenter'
Plugin 'tpope/vim-commentary'
Plugin 'vim-airline/vim-airline'
Plugin 'heavenshell/vim-jsdoc' " After install: cd to <vim-jsdoc path>; make install
" Use YCM for Javascript, use Coc for everything else.
Plugin 'neoclide/coc.nvim' " After install: :CocInstall <extensions> (e.g. coc-sql, coc-git, coc-yaml, coc-python, coc-json, coc-html, coc-go, coc-css)
"Plugin 'ycm-core/YouCompleteMe' " After install: cd ~/.vim/bundle/YouCompleteMe; python3 install.py --ts-completer
call vundle#end()            " required
filetype plugin indent on    " required
"filetype plugin on
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line

""" Plugin Configuration

"" NERDTree Settings:
map <C-n> :NERDTreeToggle<CR> 

"" Prettier Settings:
map <F9> :Prettier<CR> 

"" Syntastic Settings:
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 0
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_javascript_checkers = ['jshint']
let g:syntastic_html_checkers = ['htmlhint']
let g:syntastic_css_checkers = ['csslint']
let g:syntastic_go_checkers = ['golint']
let g:syntastic_yaml_checkers = ['yamllint']
let g:syntastic_markdown_checkers = []

"" CTRLP Settings:
let g:ctrlp_user_command = ['.git/'] 
", 'git --git-dir=%s/.git ls-files -oc --exclude-standard'] " Help ctrlp ignore things you don't want to search for.
let g:ctrlp_use_caching = 0 " Turn off caching in ctrlp

"" Theme Settings
colorscheme codedark
set background=dark
let g:airline_theme = 'codedark'

"" Prettier Settingsc
let g:prettier#autoformat_require_pragma = 0 " don't require @prettier in the file
let g:prettier#autoformat_config_present = 1 " require a .prettierrc in path

"" Coc Settings:
function! s:check_back_space() abort
    let col = col('.') - 1
    return !col || getline('.')[col - 1]  =~ '\s'
endfunction

fun! GoCoc()
	inoremap <silent><expr> <Tab>
	    \ pumvisible() ? "\<C-n>" :
	    \ <SID>check_back_space() ? "\<Tab>" :
	    \ coc#refresh()
	
	" GoTo code navigation.
	nmap <buffer> <leader>gd <Plug>(coc-definition)
	nmap <buffer> <leader>gy <Plug>(coc-type-definition)
	nmap <buffer> <leader>gi <Plug>(coc-implementation)
	nmap <buffer> <leader>gr <Plug>(coc-references)
endfun

"" YCM Settings:
"fun! GoYCM()
	nnoremap <buffer> <silent> <leader>gd :YcmCompleter GoTo<CR>
	nnoremap <buffer> <silent> <leader>gr :YcmCompleter GoToReferences<CR>
	nnoremap <buffer> <silent> <leader>rr :YcmCompleter RefactorName<space>
"endfun

"" YCM vs Coc Settings:
"autocmd FileType javascript :call GoYCM()
"autocmd FileType css :call GoCoc()

""" VIM Settings

syntax on
set noerrorbells
set expandtab
"set nowrap
set smartindent
set noswapfile
set nobackup
set undodir=~/.vim/undodir
set undofile
set incsearch

""" Visual Settings

"set colorcolumn=80
"highlight ColorColumn ctermbg=0 guibg=lightgrey

" Turn on line numbers (hybrid)
set nu rnu

""" Formatting Settings

" Disable automatic comment insertion
autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o

" Show 10 lines before/after
set scrolloff=10

" Show cursor line
:set cursorline

" Disable auto-ident
"filetype indent off

" Tab settings
set tabstop=4
set shiftwidth=4
set expandtab

""" Mappings

" Remap leader to space
let mapleader = " "

" Paste toggle button to F2
set pastetoggle=<F2>

nnoremap <leader>h :wincmd h<CR>
nnoremap <leader>j :wincmd j<CR>
nnoremap <leader>k :wincmd k<CR>
nnoremap <leader>l :wincmd l<CR>
nnoremap <leader>u :UndotreeShow<CR>
nnoremap <leader>m :tabn<CR>
nnoremap <leader>n :tabp<CR>
nnoremap <leader>b :tabnew<CR>
nnoremap <Leader>= :vertical resize +5<CR>
nnoremap <Leader>- :vertical resize -5<CR>

" Leader+o/O will add a line below/above current line without changing line
nnoremap <silent> <leader>o :<C-u>call append(line("."),   repeat([""], v:count1))<CR>
nnoremap <silent> <leader>O :<C-u>call append(line(".")-1, repeat([""], v:count1))<CR>

" Implement shift-tab to remove a tab
" for command mode
nnoremap <S-Tab> <<
" for insert mode
inoremap <S-Tab> <C-d>

""" Testing

" Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
" delays and poor user experience.
set updatetime=50

au BufNewFile,BufRead *.ejs set filetype=html

set mouse=
