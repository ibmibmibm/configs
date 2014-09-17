if has('vim_starting')
    set nocompatible
    if &shell =~# 'fish$'
        set shell=sh
    endif
    set runtimepath+=~/.vim/bundle/neobundle.vim/
endif
call neobundle#begin(expand('~/.vim/bundle/'))
NeoBundleFetch 'Shougo/neobundle.vim'
"NeoBundle 'gmarik/vundle'

NeoBundle 'chusiang/vimcdoc-tw'

NeoBundle 'Chiel92/vim-autoformat'
NeoBundle 'Lokaltog/powerline', {'rtp':'powerline/bindings/vim'}
NeoBundle 'Lokaltog/vim-easymotion'
NeoBundle 'SirVer/ultisnips'
NeoBundle 'Yggdroot/indentLine'
NeoBundle 'bronson/vim-trailing-whitespace'
NeoBundle 'ciaranm/detectindent'
NeoBundle 'hdima/python-syntax'
NeoBundle 'honza/vim-snippets'
NeoBundle 'kien/ctrlp.vim'
NeoBundle 'kien/rainbow_parentheses.vim'
NeoBundle 'majutsushi/tagbar'
NeoBundle 'rking/ag.vim'
NeoBundle 'scrooloose/nerdcommenter'
NeoBundle 'scrooloose/nerdtree'
NeoBundle 'scrooloose/syntastic'
NeoBundle 'sjl/gundo.vim'
NeoBundle 'terryma/vim-expand-region'
NeoBundle 'terryma/vim-multiple-cursors'
NeoBundle 'tpope/vim-fugitive'
NeoBundle 'tpope/vim-surround'
NeoBundle 'vimwiki/vimwiki'

"NeoBundle 'pangloss/vim-javascript'
NeoBundle 'chikamichi/mediawiki.vim'
NeoBundle 'chrisbra/csv.vim'
NeoBundle 'dag/vim-fish'
NeoBundle 'evanmiller/nginx-vim-syntax'
NeoBundle 'fatih/vim-go'
NeoBundle 'ibmibmibm/vim-cue'
NeoBundle 'jelera/vim-javascript-syntax'
NeoBundle 'othree/html5.vim'
NeoBundle 'plasticboy/vim-markdown'
NeoBundle 'tejr/vim-tmux'
NeoBundle 'wting/rust.vim'

NeoBundle 'nanotech/jellybeans.vim'
NeoBundle 'tomasr/molokai'
NeoBundle 'altercation/vim-colors-solarized'
NeoBundle 'jnurmine/Zenburn'

NeoBundle 'Shougo/vimproc.vim', {
\       'build' : {
\           'windows' : 'tools\\update-dll-mingw',
\           'cygwin' : 'make -f make_cygwin.mak',
\           'mac' : 'make -f make_mac.mak',
\           'unix' : 'make -f make_unix.mak',
\       },
\   }

if ! has("win32") && v:version > 703 || (v:version == 703 && has("patch584"))
    NeoBundle 'Valloric/YouCompleteMe', {
\       'build' : {
\           'cygwin' : 'bash install.sh --clang-completer --system-libclang --omnisharp-completer',
\           'mac' : 'bash install.sh --clang-completer --system-libclang --omnisharp-completer',
\           'unix' : 'bash install.sh --clang-completer --system-libclang --omnisharp-completer',
\       },
\   }
endif

call neobundle#end()
filetype plugin indent on
NeoBundleCheck

if has("win32")
    set dir=$TEMP
    set guifont=Sauce_Code_Powerline:h12:cANSI
    let $LANG="zh_TW.UTF-8"
    set langmenu=zh_tw.utf-8
    set encoding=utf8

    "reload menu with UTF-8 encoding
    source $VIMRUNTIME/delmenu.vim
    source $VIMRUNTIME/menu.vim
else
    set guifont=Source\ Code\ Pro\ for\ Powerline\ Light\ 12
    set encoding=utf-8
    set dir=~/.cache/vim/
endif

syntax enable

set background=light
let g:solarized_diffmode="normal"
colorscheme solarized

"let g:zenburn_enable_TagHighlight=1
"colors zenburn
"colors jellybeans
"set background=dark
"hi Normal ctermbg=None
"hi NonText ctermbg=None
"hi SpecialKey ctermbg=None

set backspace=indent,eol,start
set tabstop=4
let g:detectindent_preferred_expandtab = 0
let g:detectindent_preferred_indent = 4

set nowrap
set history=50
set ruler
set showcmd
set mouse=a
set cc=80
set ignorecase
set smartcase
set showmatch
set t_Co=256
set number
set noshowmode
set hlsearch
set ffs=unix
set laststatus=2
set ambiwidth=single
set tags=~/.vim/tags
set foldmethod=syntax
set clipboard=unnamedplus
set undofile
set undodir=~/.vim/undo
set undolevels=1000
set undoreload=10000

noremap <F3> :Autoformat<CR>
noremap <F4> :RainbowParenthesesToggle<CR>
noremap <F5> :GundoToggle<CR>
noremap <F6> :NERDTreeToggle<CR>
call togglebg#map('<F7>')
"noremap <F7> :set hlsearch! hlsearch?<CR>
noremap <F8> :TagbarToggle<CR>
set pastetoggle=<F9>
"noremap <F10> :YcmDiags<CR>
noremap <F12> :!env TMPDIR=/home/tmp ctags -R --sort=yes --c++-kinds=+p --fields=+iaS --extra=+q . ; env TMPDIR=/home/tmp cscope -Rbkq<CR>
"noremap <S-F12> :!rm -vi cscope.in.out cscope.out cscope.po.out tags<CR>

autocmd VimEnter * RainbowParenthesesToggle
autocmd Syntax * RainbowParenthesesLoadRound
autocmd Syntax * RainbowParenthesesLoadSquare
autocmd Syntax * RainbowParenthesesLoadBraces
autocmd BufNewFile,BufRead * DetectIndent
autocmd BufNewFile,BufRead *.c let g:ycm_global_ycm_extra_conf = '~/.vim/ycm_c.py'
autocmd BufNewFile,BufRead *.cpp let g:ycm_global_ycm_extra_conf = '~/.vim/ycm_cpp.py'

set listchars=tab:\|-,trail:.,extends:⇢,precedes:⇠,eol:↲
set list

let g:vundle_default_git_proto = 'git'
let g:ycm_key_list_select_completion = ['<C-TAB>', '<Down>']
let g:ycm_key_list_previous_completion = ['<C-S-TAB>', '<Up>']
let g:SuperTabDefaultCompletionType = '<C-Tab>'
let g:ycm_confirm_extra_conf = 0
let g:ycm_key_invoke_completion = '<C-Right>'
let g:formatprg_cpp = 'uncrustify'
let g:formatprg_args_cpp = '-q -l cpp'
"let g:formatprg_args_cpp = '--style=linux -pT4H'
let g:ctrlp_custom_ignore = {
\       'dir':  '\v[\/]\.(git|hg|svn)$',
\       'file': '\v\.(exe|so|dll)$',
\   }
let g:ctrlp_user_command = {
\       'types': {
\           1: ['.git', 'cd %s && git ls-files'],
\           2: ['.hg', 'hg --cwd %s locate -I .'],
\       },
\       'fallback': 'find %s -type f'
\   }
" Trigger configuration. Do not use <tab> if you use https://github.com/Valloric/YouCompleteMe.
"let g:UltiSnipsExpandTrigger='<c-tab>'
"let g:UltiSnipsJumpForwardTrigger='<c-b>'
"let g:UltiSnipsJumpBackwardTrigger='<c-z>'

" If you want :UltiSnipsEdit to split your window.
let g:UltiSnipsEditSplit='vertical'

let g:syntastic_c_compiler = 'gcc'
let g:syntastic_c_compiler_options = '-std=c11'
let syntastic_c_include_dirs = []
let g:syntastic_cpp_compiler = 'g++'
let g:syntastic_cpp_compiler_options = '-std=c++1y'
let syntastic_cpp_include_dirs = []

let g:go_bin_path = expand('~/.local/bin/')

autocmd BufNewFile,BufRead *.upstart set ft=upstart

"let g:csv_autocmd_arrange = 1
"let b:csv_arrange_leftalign = 1

for rcfile in split(globpath('~/.vim/rc', '*.vim'), '\n')
    execute('source '.rcfile)
endfor
