let s:dein_dir = expand('~/.vim/dein')
let s:dein_repo_dir = s:dein_dir . '/repos/github.com/Shougo/dein.vim'
let g:python3_host_prog = '/usr/local/bin/python3'

if &compatible
  set nocompatible
endif

if !isdirectory(s:dein_repo_dir)
  execute '!git clone git@github.com:Shougo/dein.vim.git' s:dein_repo_dir
endif

execute 'set runtimepath^=' . s:dein_repo_dir

call dein#begin(s:dein_dir)

call dein#add('Shougo/dein.vim')
call dein#add('Shougo/ddc.vim')
call dein#add('vim-denops/denops.vim')
call dein#add('Shougo/neosnippet.vim') 
call dein#add('Shougo/neosnippet-snippets') 
call dein#add('itchyny/lightline.vim') 
call dein#add('nathanaelkane/vim-indent-guides')
call dein#add('Townk/vim-autoclose') 
call dein#add('honza/vim-snippets') 
call dein#add('ujihisa/neco-look') 
call dein#add('tpope/vim-surround') 
call dein#add('tpope/vim-haml') 
call dein#add('tpope/vim-endwise') 
call dein#add('ctrlpvim/ctrlp.vim') 
call dein#add('thinca/vim-ref') 
call dein#add('slim-template/vim-slim') 
call dein#add('szw/vim-tags') 
call dein#add('scrooloose/syntastic') 
call dein#add('cespare/vim-toml') 
call dein#add('Shougo/unite.vim') 
call dein#add('Shougo/neoinclude.vim') 
call dein#add('Shougo/context_filetype.vim') 
call dein#add('kana/vim-operator-user') 
call dein#add('Shougo/vimproc.vim', {'build': 'make'}) 
call dein#add('tomasr/molokai') 
"call dein#add('joshdick/onedark.vim') 
call dein#add('osyo-manga/vim-reunions' )
call dein#add('osyo-manga/vim-marching', {
            \ 'depends' : ['Shougo/vimproc.vim', 'osyo-manga/vim-reunions'],
            \ 'autoload' : {'filetypes' : ['c', 'cpp']}
            \ }) 
call dein#add('vim-jp/cpp-vim', {
            \ 'autoload' : {'filetypes' : 'cpp'}
            \ }) 
call dein#add('scrooloose/nerdtree')
call dein#add('jistr/vim-nerdtree-tabs')
call dein#add('davidhalter/jedi-vim', {
            \ 'autoload' : {'filetypes' : 'python'}
            \ })
call dein#add('christoomey/vim-tmux-navigator')
call dein#add('AndrewRadev/linediff.vim')
call dein#add('tell-k/vim-autopep8', {
            \ 'autoload' : {'filetypes' : 'python'}
            \ })

call dein#end()

if dein#check_install()
  call dein#install()
endif


set nu
set encoding=utf-8
colorscheme molokai
"colorscheme onedark
syntax on
set t_Co=256
set t_ut=
let g:molokai_original = 1
let g:rehash256 = 1
"let g:onedark_termcolors=16
set background=dark
set showmode
set title
set ruler
set showcmd
set showmatch
set scrolloff=5
set cursorline
highlight CursorLine cterm=underline ctermfg=NONE ctermbg=NONE
set nolist
"set listchars=tab:-,trail:
set laststatus=2
highlight ZenkakuSpace cterm=underline ctermfg=lightblue guibg=#666666
au BufNewFile,BufRead * match ZenkakuSpace //
set autoread " update file automaticaly
set expandtab " insert space character insted tab
inoremap <silent> jj <ESC> " change from insert to command by typping jj"
set nosi                " disable smartindext
set tabstop=2 shiftwidth=2 softtabstop=2        "set indent space
set ts=2 sw=2 et
set backspace=2
set wrapscan
set ignorecase
set smartcase
set noincsearch
set hlsearch
let mapleader = "\<Space>"
let &t_ti.="\e[1 q"
let &t_SI.="\e[5 q"
let &t_EI.="\e[1 q"
let &t_te.="\e[0 q"

let g:lightline = {
      \ 'colorscheme': 'wombat',
      \ 'active': {
      \   'left': [['mode', 'paste'],
      \            ['fugitive', 'readonly', 'filename', 'modified']]
      \ },
      \ 'component': {
      \   'readonly': '%{&filetype=="help"?"":&readonly?"":""}',
      \   'modified': '%{&filetype=="help"?"":&modified?"+":&modifiable?"":"-"}',
      \   'fugitive': '%{exists("*fugitive#head")?fugitive#head():""}'
      \ },
      \ 'component_visible_condition': {
      \   'readonly': '(&filetype!="help"&& &readonly)',
      \   'modified': '(&filetype!="help"&&(&modified||!&modifiable))',
      \   'fugitive': '(exists("*fugitive#head") && ""!=fugitive#head())'
      \ },
  \ }

augroup cpp-namespace
  autocmd!
  autocmd FileType cpp inoremap <buffer><expr>; <SID>expand_namespace()
augroup END
augroup cpp-path
  autocmd!
  autocmd FileType cpp setlocal path='.,/usr/include,/usr/local/include,/root/ns-3.26/source/ns-3.26/build/'
augroup END
function! s:expand_namespace()
  let s = getline('.')[0:col('.')-1]
  if s =~# '\<b;$'
    return "\<BS>oost::"
  elseif s =~# '\<s;$'
    return "\<BS>td::"
  elseif s =~# '\<d;$'
    return "\<BS>etail::"
  elseif s =~# '\<p;$'
    return "\<BS>qxx::"
  else
    return ';'
  endif
endfunction

let g:neomru#time_format = "(%Y/%m/%d %H:%M:%S) "
noremap :um :Unite file_mru

let g:marching_enable_neocomplete = 1
let g:indent_guides_enable_on_vim_startup = 1
let g:indent_guides_auto_colors = 0
"autocmd VimEnter,Colorscheme * :hi IndentGuidesOdd ctermbg=97
"autocmd VimEnter,Colorscheme * :hi IndentGuidesEven ctermbg=68
autocmd VimEnter,Colorscheme * :hi IndentGuidesOdd ctermbg=98
autocmd VimEnter,Colorscheme * :hi IndentGuidesEven ctermbg=39
let g:indent_guides_guide_size=1

let g:acp_enableAtStartup = 0
imap <expr><TAB> neosnippet#jumpable() ? "\<Plug>(neosnippet_expand_or_jump)" : pumvisible() ? "\<C-n>" : "\<TAB>"
smap <expr><TAB> neosnippet#jumpable() ? "\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>"
let g:marching_include_paths = [
      \ "/root/ns-3.26/source/ns-3.26/build/"
      \]
let g:marching#clang_command#options = {
      \ "cpp" : "-std=c++1y"
      \}
set updatetime=200

let g:nerdtree_tabs_open_on_console_startup=1
"autocmd VimEnter * NERDTree
let g:NERDTreeShowBookmarks=1
autocmd vimenter * wincmd p

nnoremap <Leader>l gt

autocmd FileType cpp set keywordprg=cppman
command! -nargs=+ Cppman silent! call system("tmux split-window cppman " . expand(<q-args>))
      \}
autocmd FileType cpp nnoremap <silent><buffer> K <Esc>:Cppman <cword><CR>

set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 0
let g:syntastic_auto_loc_list = 0
let g:syntastic_check_on_open= 0
let g:syntastic_check_on_wq = 0
let g:syntastic_python_checkers = ['flake8']
let g:syntastic_cpp_compiler_options = '-std=c++11'
let g:syntastic_c_include_dirs = ['~/bake/source/ns-3.28/src/']

autocmd BufNewFile,BufRead *.py nnoremap <C-e> :!python3 % <CR>
nnoremap <Leader>h :vsp<CR> :exe("tjump ".expand('<cword>'))<CR>
nnoremap <Leader>v :split<CR> :exe("tjump ".expand('<cword>'))<CR>

map <Leader>py :w !python3<CR>

let g:autopep8_on_save = 1
let g:autopep8_disable_show_diff=1

let g:denops_disable_version_check = 1
