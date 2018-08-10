if &compatible
    set nocompatible
    if &shell =~# 'fish$'
        set shell=bash
    endif
endif
set runtimepath+=~/.vim/bundle/repos/github.com/Shougo/dein.vim

if dein#load_state(expand('~/.vim/bundle'))
    call dein#begin(expand('~/.vim/bundle'))

    call dein#add('Shougo/dein.vim')
    call dein#add('Shougo/deoplete.nvim')
    if !has('nvim')
      call dein#add('roxma/nvim-yarp')
      call dein#add('roxma/vim-hug-neovim-rpc')
    endif
    call dein#add('autozimu/LanguageClient-neovim', {'branch': 'next', 'build': 'bash install.sh'})

    "call dein#add('Shougo/neosnippet.vim')
    "call dein#add('Shougo/neosnippet-snippets')

    call dein#add('Shougo/vimproc.vim', {'build' : 'make'})

    call dein#add('chusiang/vimcdoc-tw')
    "call dein#add('editorconfig/editorconfig-vim')

    call dein#add('Chiel92/vim-autoformat')
    if has("python") || has("python3")
        call dein#add('powerline/powerline', {
\           'rtp' : 'powerline/bindings/vim',
\           'build' : 'gcc -std=c11 -O2 -march=native client/powerline.c -o client/powerline',
\       })

        call dein#add('SirVer/ultisnips')
    endif
    call dein#add('easymotion/vim-easymotion')
    call dein#add('nixprime/cpsm', {'build' : 'env PY3=ON ./install.sh'})
    call dein#add('Shougo/denite.nvim')
    call dein#add('Yggdroot/indentLine')
    call dein#add('bronson/vim-trailing-whitespace')
    call dein#add('ciaranm/detectindent')
    call dein#add('hdima/python-syntax', {'on_ft' : ['python']})
    call dein#add('honza/vim-snippets')
    "call dein#add('kien/rainbow_parentheses.vim')
    "call dein#add('klen/python-mode')
    call dein#add('majutsushi/tagbar')
    call dein#add('rking/ag.vim')
    call dein#add('scrooloose/nerdcommenter')
    call dein#add('scrooloose/nerdtree', {'on_cmd' : ['NERDTree', 'NERDTreeToggle']})
    call dein#add('scrooloose/syntastic')
    call dein#add('sjl/gundo.vim', {'on_cmd' : 'GundoToggle'})
    call dein#add('stephpy/vim-php-cs-fixer')
    call dein#add('terryma/vim-expand-region')
    call dein#add('terryma/vim-multiple-cursors', {'on_map' : {'n' : ['<C-n>', '<C-p>'], 'x' : '<C-n>'}})
    call dein#add('tpope/vim-fugitive')
    call dein#add('tpope/vim-surround', {'on_map' : {'n' : ['cs', 'ds', 'ys'], 'x' : 'S'}})
    call dein#add('vimwiki/vimwiki')

    call dein#add('apeschel/vim-syntax-syslog-ng', {'on_path' : '*syslog*'})
    call dein#add('chikamichi/mediawiki.vim')
    call dein#add('chr4/nginx.vim', {'on_path' : ['*.nginx', 'nginx*.conf', '*nginx.conf', '*/etc/nginx/*', '*/usr/local/nginx/conf/*']})
    call dein#add('chrisbra/csv.vim', {'on_path' : ['*.csv', '*.dat', '*.tsv', '*.tab']})
    call dein#add('dag/vim-fish', {'on_path' : ['*.fish', expand('~/.config/fish/**')]})
    call dein#add('ekalinin/Dockerfile.vim', {'on_path' : ['Dockerfile*', '*.dock', '*.[Dd]ockerfile']})
    call dein#add('fatih/vim-go', {'on_ft' : 'go'})
    call dein#add('gavilancomun/vim-antlr', {'on_path' : ['*.g3', '*.g4']})
    call dein#add('ibmibmibm/vim-cue', {'on_path' : '*.cue'})
    call dein#add('jelera/vim-javascript-syntax', {'on_ft' : 'javascript'})
    call dein#add('othree/html5.vim', {'on_ft' : 'html'})
    call dein#add('godlygeek/tabular')
    call dein#add('plasticboy/vim-markdown', {
\       'depends' : ['tabular'],
\       'build' : 'make'
\   })
    call dein#add('tmux-plugins/vim-tmux', {'on_path' : '{.,}tmux*.conf'})
    call dein#add('wting/rust.vim', {'on_path' : '*.rs'})

    call dein#add('nanotech/jellybeans.vim')
    call dein#add('tomasr/molokai')
    call dein#add('altercation/vim-colors-solarized')
    call dein#add('jnurmine/Zenburn')

"    if ! has("win32") && v:version > 703 || (v:version == 703 && has("patch584"))
"        call dein#add('rdnetto/YCM-Generator', {'rev': 'develop', 'on_ft': ['c', 'cpp', 'python', 'javascript', 'go', 'cs']})
"        call dein#add('Valloric/YouCompleteMe', {'on_ft': ['c', 'cpp', 'python', 'javascript', 'go', 'cs', 'rust'],
"\           'build' : 'python install.py --clang-completer --gocode-completer --tern-completer --rust-completer --system-boost --system-libclang',
"\       })
"    endif

    call dein#end()
    if $USER != 'root'
        call dein#save_state()
    endif
endif

"call map(dein#check_clean(), "delete(v:val, 'rf')")
call dein#recache_runtimepath()

filetype plugin indent on
syntax enable

if $USER != 'root'
    if dein#check_install()
        call dein#install()
    endif
endif

if has("win32")
    set dir=$TEMP
    set guifont=Sauce_Code_Powerline:h9:cANSI
    let $LANG="zh_TW.UTF-8"
    set langmenu=zh_tw.utf-8
    set encoding=utf8

    "reload menu with UTF-8 encoding
    source $VIMRUNTIME/delmenu.vim
    source $VIMRUNTIME/menu.vim
else
    set guifont=Source\ Code\ Pro\ for\ Powerline\ Light\ 9
    set encoding=utf-8
    set dir=~/.cache/vim/
endif

"set background=light
"let g:solarized_diffmode="high"
"let g:solarized_diffmode="normal"
"let g:solarized_termcolors=256
"colorscheme solarized

"let g:zenburn_enable_TagHighlight=1
"colorscheme zenburn
colorscheme jellybeans
"set background=dark
"hi Normal ctermbg=None
"hi NonText ctermbg=None
"hi SpecialKey ctermbg=None

set tabpagemax=1000
set modeline
set backspace=indent,eol,start
set tabstop=4
let g:detectindent_preferred_expandtab = 1
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
set incsearch
set hlsearch
set ffs=unix
set laststatus=2
set ambiwidth=single
set tags=~/.vim/tags
set foldmethod=syntax
set foldlevelstart=20
set clipboard=unnamedplus
set undofile
set undodir=~/.vim/undo
set undolevels=1000
set undoreload=10000
set diffopt=filler,vertical
"set diffopt=filler,horizontal
"set spell spelllang=en_us

if &term =~ '^screen'
    set ttymouse=xterm2
endif

"putty
noremap <Esc>Oq 1
noremap <Esc>Or 2
noremap <Esc>Os 3
noremap <Esc>Ot 4
noremap <Esc>Ou 5
noremap <Esc>Ov 6
noremap <Esc>Ow 7
noremap <Esc>Ox 8
noremap <Esc>Oy 9
noremap <Esc>Op 0
noremap <Esc>On .
noremap <Esc>OQ /
noremap <Esc>OR *
noremap <Esc>Ol +
noremap <Esc>OS -
noremap <Esc>OM <Enter>
noremap! <Esc>Oq 1
noremap! <Esc>Or 2
noremap! <Esc>Os 3
noremap! <Esc>Ot 4
noremap! <Esc>Ou 5
noremap! <Esc>Ov 6
noremap! <Esc>Ow 7
noremap! <Esc>Ox 8
noremap! <Esc>Oy 9
noremap! <Esc>Op 0
noremap! <Esc>On .
noremap! <Esc>OQ /
noremap! <Esc>OR *
noremap! <Esc>Ol +
noremap! <Esc>OS -
noremap! <Esc>OM <Enter>

noremap <F3> :Autoformat<CR>
"noremap <F4> :RainbowParenthesesToggle<CR>
noremap <F5> :GundoToggle<CR>
noremap <F6> :NERDTreeToggle<CR>
"call togglebg#map('<F7>')
"noremap <F7> :set hlsearch! hlsearch?<CR>
noremap <F7> :set number!<CR>:set list!<CR>:IndentLinesToggle<CR>
noremap <F8> :TagbarToggle<CR>
set pastetoggle=<F9>
"noremap <F10> :YcmDiags<CR>
noremap <F12> :call vimproc#system('env TMPDIR=/home/tmp nice -n 10 ctags -R --sort=yes --c++-kinds=+p --fields=+iaS --extra=+q . ; env TMPDIR=/home/tmp nice -n 10 cscope -Rbkq')<CR>
"noremap <S-F12> :!rm -vi cscope.in.out cscope.out cscope.po.out tags<CR>

nmap <silent> <C-u><C-p> :<C-u>Denite file_rec<CR>
call denite#custom#var('file_rec', 'matcher', ['matcher_cpsm'])
call deoplete#custom#source('_', 'matchers', ['matcher_cpsm'])

autocmd BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g`\"" | endif

"autocmd VimEnter * RainbowParenthesesToggle
"autocmd Syntax * RainbowParenthesesLoadRound
"autocmd Syntax * RainbowParenthesesLoadSquare
"autocmd Syntax * RainbowParenthesesLoadBraces
autocmd BufNewFile,BufRead * DetectIndent
"autocmd FileType c let g:ycm_global_ycm_extra_conf = '~/.vim/ycm_c.py'
"autocmd FileType cpp let g:ycm_global_ycm_extra_conf = '~/.vim/ycm_cpp.py'

"set listchars=tab:\|-,trail:.,extends:⇢,precedes:⇠,eol:↲
set listchars=tab:\|-,trail:.,extends:>,precedes:<,eol:$
set list

let g:gundo_prefer_python3 = 1
let g:LanguageClient_serverCommands = {
    \ "c": ['cquery', '--log-file='.expand('~/.vim/cq.log')],
    \ "cpp": ['cquery', '--log-file='.expand('~/.vim/cq.log')],
    \ }
let g:LanguageClient_loadSettings = 1
let g:LanguageClient_settingsPath = expand('~/.vim/settings.json')

"let g:EditorConfig_exclude_patterns = ['fugitive://.*', 'scp://.*']
"let g:ycm_key_list_select_completion = ['<C-TAB>', '<Down>']
"let g:ycm_key_list_previous_completion = ['<C-S-TAB>', '<Up>']
let g:SuperTabDefaultCompletionType = '<C-Tab>'
"let g:ycm_confirm_extra_conf = 0
"let g:ycm_key_invoke_completion = '<C-Right>'
let g:formatprg_cpp = 'uncrustify'
let g:formatprg_args_cpp = '-q -l cpp'
"let g:formatprg_args_cpp = '--style=linux -pT4H'
" Trigger configuration. Do not use <tab> if you use https://github.com/Valloric/YouCompleteMe.

let g:UltiSnipsUsePythonVersion = 3
let g:UltiSnipsEditSplit='vertical'
let g:UltiSnipsSnippetsDir='~/.vim/snippets'

let g:syntastic_c_compiler = 'gcc'
let g:syntastic_c_compiler_options = '-std=c11'
let syntastic_c_include_dirs = []
let g:syntastic_cpp_compiler = 'g++'
let g:syntastic_cpp_compiler_options = '-std=c++1y'
let syntastic_cpp_include_dirs = []

let g:go_bin_path = expand('~/.local/bin/')

let g:dein#enable_notification = 1
let g:deoplete#enable_at_startup = 1

autocmd BufNewFile,BufRead *.upstart set ft=upstart

"let g:csv_autocmd_arrange = 1
"let b:csv_arrange_leftalign = 1

for rcfile in split(globpath('~/.vim/rc', '*.vim'), '\n')
    execute('source '.rcfile)
endfor
