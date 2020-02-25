" neobundle settings {{{ if has('vim_starting')
if has('vim_starting')
    set nocompatible
    " neobundle をインストールしていない場合は自動インストール
    if !isdirectory(expand("~/.vim/bundle/neobundle.vim/"))
        echo "install neobundle..."
        " vim からコマンド呼び出しているだけ neobundle.vim のクローン
        :call system("git clone git://github.com/Shougo/neobundle.vim ~/.vim/bundle/neobundle.vim")
    endif
    " runtimepath の追加は必須
    set runtimepath+=~/.vim/bundle/neobundle.vim/
endif
call neobundle#begin(expand('~/.vim/bundle'))
let g:neobundle_default_git_protocol='https'

" neobundle#begin - neobundle#end の間に導入するプラグインを記載します。
NeoBundleFetch 'Shougo/neobundle.vim'
" ↓こんな感じが基本の書き方
NeoBundle 'nanotech/jellybeans.vim'
NeoBundle 'altercation/vim-colors-solarized'
NeoBundle 'w0ng/vim-hybrid'
NeoBundle 'vim-scripts/twilight'
NeoBundle 'jonathanfilip/vim-lucius'
NeoBundle 'jpo/vim-railscasts-theme'
NeoBundle 'vim-scripts/Wombat'
NeoBundle 'tomasr/molokai'
NeoBundle 'vim-scripts/rdark'
NeoBundle 'Shougo/unite.vim'
    " unite {{{
    let g:unite_enable_start_insert=1
    nmap <silent> <C-u><C-b> :<C-u>Unite buffer<CR>
    nmap <silent> <C-u><C-f> :<C-u>UniteWithBufferDir -buffer-name=files file<CR>
    nmap <silent> <C-u><C-r> :<C-u>Unite -buffer-name=register register<CR>
    nmap <silent> <C-u><C-m> :<C-u>Unite file_mru<CR>
    nmap <silent> <C-u><C-u> :<C-u>Unite buffer file_mru<CR>
    nmap <silent> <C-u><C-a> :<C-u>UniteWithBufferDir -buffer-name=files buffer file_mru bookmark file<CR>
    au FileType unite nmap <silent> <buffer> <expr> <C-j> unite#do_action('split')
    au FileType unite imap <silent> <buffer> <expr> <C-j> unite#do_action('split')
    au FileType unite nmap <silent> <buffer> <expr> <C-l> unite#do_action('vsplit')
    au FileType unite imap <silent> <buffer> <expr> <C-l> unite#do_action('vsplit')
    au FileType unite nmap <silent> <buffer> <ESC><ESC> q
    au FileType unite imap <silent> <buffer> <ESC><ESC> <ESC>q
    " }}}
NeoBundle 'Shougo/neomru.vim', {
    \ 'depends' : 'Shougo/unite.vim'
    \ }
NeoBundle 'Shougo/vimproc', {
    \ 'build' : {
        \     'windows' : 'make -f make_mingw32.mak',
        \     'cygwin' : 'make -f make_cygwin.mak',
        \     'mac' : 'make -f make_mac.mak',
        \     'unix' : 'make -f make_unix.mak',
        \    },
    \ }

if has('lua')
    NeoBundleLazy 'Shougo/neocomplete.vim', {
        \ 'depends' : 'Shougo/vimproc',
        \ 'autoload' : { 'insert' : 1,}
        \ }
endif
    "  neocomplete {{{
    let g:neocomplete#enable_at_startup               = 1
    let g:neocomplete#auto_completion_start_length    = 3
    let g:neocomplete#enable_ignore_case              = 1
    let g:neocomplete#enable_smart_case               = 1
    let g:neocomplete#enable_camel_case               = 1
    let g:neocomplete#use_vimproc                     = 1
    let g:neocomplete#sources#buffer#cache_limit_size = 1000000
    let g:neocomplete#sources#tags#cache_limit_size   = 30000000
    let g:neocomplete#enable_fuzzy_completion         = 1
       let g:neocomplete#lock_buffer_name_pattern        = '\*ku\*'
    " }}}
NeoBundleLazy 'Shougo/vimshell', {
    \ 'depends' : 'Shougo/vimproc',
    \ 'autoload' : {
    \ 'commands' : [{ 'name' : 'VimShell', 'complete' : 'customlist,vimshell#complete'},
    \                 'VimShellExecute', 'VimShellInteractive',
    \                 'VimShellTerminal', 'VimShellPop'],
    \ 'mappings' : ['<Plug>(vimshell_switch)']
    \ }}

    " vimshell {{{
    nmap <silent> vs :<C-u>VimShell<CR>
    nmap <silent> vp :<C-u>VimShellPop<CR>
    nmap <silent> vi :<C-u>VimShellInteractive<CR>
    nmap <silent> vip :VimShellInteractive ipython<CR>
    vmap <silent> ,ss :VimShellSendString<CR>
    nnoremap <silent> ,ss <S-v>:VimShellSendString<CR>
    " }}}

NeoBundle 'Townk/vim-autoclose'
NeoBundleLazy 'tpope/vim-endwise', {
    \ 'autoload' : { 'insert' : 1,}}
NeoBundle 'glidenote/memolist.vim'
    " memolist {{{
    let g:memolist_path = expand('~/GoogleDrive/memolist')
    let g:memolist_gfixgrep = 1
    let g:memolist_unite = 1
    let g:memolist_unite_option = "-vertical -start-insert"
    nnoremap mn  :MemoNew<CR>
    nnoremap ml  :MemoList<CR>
    nnoremap mg  :MemoGrep<CR>
    " }}}
NeoBundle 'Lokaltog/vim-easymotion'
    " vim-easymotion {{{
    let g:EasyMotion_do_mapping = 0
    nmap s <Plug>(easymotion-s2)
    xmap s <Plug>(easymotion-s2)
    omap z <Plug>(easymotion-s2)
    nmap g/ <Plug>(easymotion-sn)
    xmap g/ <Plug>(easymotion-sn)
    omap g/ <Plug>(easymotion-tn)
    let g:EasyMotion_smartcase = 1
    map <Leader>j <Plug>(easymotion-j)
    map <Leader>k <Plug>(easymotion-k)
    let g:EasyMotion_startofline = 0
    let g:EasyMotion_keys = 'QZASDFGHJKL;'
    let g:EasyMotion_use_upper = 1
    let g:EasyMotion_enter_jump_first = 1
    " }}}

NeoBundleLazy 'junegunn/vim-easy-align', {
    \ 'autoload': {
    \ 'commands' : ['EasyAlign'],
    \ 'mappings' : ['<Plug>(EasyAlign)'],
    \ }}
    " vim-easy-align {{{
    vmap <Enter> <Plug>(EasyAlign)
    nmap <Leader>a <Plug>(EasyAlign)
    "}}}

NeoBundleLazy "Shougo/vimfiler", {
    \ "depends": ["Shougo/unite.vim"],
    \ "autoload": {
    \ "commands": ["VimFilerTab", "VimFiler", "VimFilerExplorer", "VimFilerBufferDir"],
    \ "mappings": ['<Plug>(vimfiler_switch)'],
    \ "explorer": 1,
    \ }}
    "vimfiler {{{
    let g:vimfiler_as_default_explorer  = 1
    let g:vimfiler_safe_mode_by_default = 0
    let g:vimfiler_data_directory       = expand('~/.vim/etc/vimfiler')
    nnoremap <silent><C-u><C-j> :<C-u>VimFilerBufferDir -split -simple -winwidth=35 -no-quit -toggle<CR>
    " }}}

NeoBundle "nathanaelkane/vim-indent-guides"
    " let g:indent_guides_enable_on_vim_startup = 1 2013-06-24 10:00 削除
    let s:hooks = neobundle#get_hooks("vim-indent-guides")
    function! s:hooks.on_source(bundle)
        let g:indent_guides_guide_size = 1
        let g:indent_guides_enable_on_vim_startup = 1
        "IndentGuidesEnable " 2013-06-24 10:00 追 
    endfunction

NeoBundle "nvie/vim-flake8", {
    \ "autoload": {
    \   "filetypes": ["python", "python3", "djangohtml"]
    \ }}
    "let g:flake8_ignore = 'E701'
    "let g:flake8_max_line_length = 120

NeoBundle "vim-scripts/SingleCompile"   ":SCCompileでコンパイル:SCCompileRunで実行

NeoBundle "thinca/vim-quickrun"         ":QuickRunでコンパイル、実行
    let g:quickrun_config = get(g:, 'quickrun_config', {})
    let g:quickrun_config._ = {
        \ 'runner'    : 'vimproc',
        \ 'runner/vimproc/updatetime' : 60,
        \ 'outputter' : 'error',
        \ 'outputter/error/success' : 'buffer',
        \ 'outputter/error/error'   : 'quickfix',
        \ 'outputter/buffer/split'  : ':rightbelow 8sp',
        \ 'outputter/buffer/close_on_empty' : 1,
        \ }
    "q でquickfixを閉じれるようにする    
    au FileType qf nnoremap <silent><buffer>q :quit<CR>
    "\r で保存してからquickrunを実行する
    " let g:quickrun_no_default_key_mappings = 1
    " nnoremap \r :write<CR>:QuickRun -mode n<CR>        
    " xnoremap \r :<C-U>write<CR>gv:QuickRun -mode v<CR>
    "\r でquickfixを閉じて、保存してからquickrunを実行する
    let g:quickrun_no_default_key_mappings = 1
    nnoremap \r :cclose<CR>:write<CR>:QuickRun -mode n<CR>
    xnoremap \r :<C-U>cclose<CR>:write<CR>gv:QuickRun -mode v<CR>
    "<C-c> でquickrunを停止
    nnoremap <expr><silent> <C-c> quickrun#is_running() ? quickrun#sweep_sessions() : "\<C-c>"

NeoBundle "tomtom/tcomment_vim"         "vidual modeで'gc'、notmal modeで'gcc'
NeoBundle "hrsh7th/vim-versions"
"エラー箇所をハイライトする
" NeoBundle "jceb/vim-hier"
NeoBundle "cohama/vim-hier"
"ステータスラインきれいに
NeoBundle "itchyny/lightline.vim"
    let g:lightline = {
        \ 'colorscheme': 'solarized',
        \ }
"python用の補完プラグイン(結構重いので場合によっては切りましょう)
"NeoBundle "davidhalter/jedi-vim"
"    autocmd FileType python setlocal omnifunc=jedi#completions
"    let g:jedi#popup_select_first=0
"    let g:jedi#completions_enabled = 0
"    let g:jedi#auto_vim_configuration = 0
"    if !exists('g:neocomplete#force_omni_input_patterns')
"        let g:neocomplete#force_omni_input_patterns = {}
"    endif
"    " let g:neocomplete#force_omni_input_patterns.python = '\%([^. \t]\.\|^\s*@\|^\s*from\s.\+import \|^\s*from \|^\s*import \)\w*'
"    let g:neocomplete#force_omni_input_patterns.python = '\h\w*\|[^. \t]\.\w*' "お好みで

"自動スペース入力
NeoBundle 'kana/vim-smartchr'
    inoremap <buffer> <expr> = smartchr#loop(' = ', ' == ', '=')
    inoremap <buffer> <expr> + smartchr#loop(' + ', ' ++ ', '+')
    inoremap <buffer> <expr> - smartchr#loop(' - ', ' -- ', '-')
    inoremap <buffer> <expr> * smartchr#loop(' * ', ' ** ', '*')
    inoremap <buffer> <expr> / smartchr#loop(' / ', ' // ', '/')
    inoremap <buffer> <expr> ; smartchr#loop('; ', ';')
    inoremap <buffer> <expr> , smartchr#loop(', ', ',')
    inoremap <buffer> <expr> += smartchr#loop(' += ', '+=')
    inoremap <buffer> <expr> *= smartchr#loop(' *= ', '*=')
    inoremap <buffer> <expr> -= smartchr#loop(' -= ', '-=')
    inoremap <buffer> <expr> /= smartchr#loop(' /= ', '/=')

" NeoBundle 'kana/vim-smartinput'
"
"     let lst = [   ['<',     "smartchr#loop(' < ', ' << ', '<')" ], 
"                 \ ['>',     "smartchr#loop(' > ', ' >> ', ' >>> ', '>')"], 
"                 \ ['+',     "smartchr#loop(' + ', ' ++ ', '+')"], 
"                 \ ['-',     "smartchr#loop(' - ', ' -- ', '-')"], 
"                 \ ['/',     "smartchr#loop(' / ', '//', '/')"], 
"                 \ ['&',     "smartchr#loop(' & ', ' && ', '&')"], 
"                 \ ['%',     "smartchr#loop(' % ', '%')"], 
"                 \ ['*',     "smartchr#loop(' * ', '*')"], 
"                 \ ['<Bar>', "smartchr#loop(' | ', ' || ', '|')"], 
"                 \ [',',     "smartchr#loop(', ', ',')"]] 
"  
"  
"      for i in lst 
"          call smartinput#map_to_trigger('i', i[0], i[0], i[0]) 
"          call smartinput#define_rule({ 'char' : i[0], 'at' : '\%#',                                      'input' : '<C-R>=' . i[1] . '<CR>'}) 
"          call smartinput#define_rule({'char' : i[0], 'at' : '^\([^"]*"[^"]*"\)*[^"]*"[^"]*\%#',          'input' : i[0]}) 
"          call smartinput#define_rule({ 'char' : i[0], 'at' : '^\([^'']*''[^'']*''\)*[^'']*''[^'']*\%#',  'input' : i[0] }) 
"      endfor 
"  
"  
"      call smartinput#define_rule({'char' : '>', 'at' : ' < \%#', 'input' : '<BS><BS><BS><><Left>'}) 
"  
"  
"      call smartinput#map_to_trigger('i', '=', '=', '=') 
"      call smartinput#define_rule({ 'char' : '=', 'at' : '\%#',                                       'input' : "<C-R>=smartchr#loop(' = ', ' == ', '=')<CR>"}) 
"      call smartinput#define_rule({ 'char' : '=', 'at' : '[&+-/<>|] \%#',                             'input' : '<BS>= '}) 
"      call smartinput#define_rule({ 'char' : '=', 'at' : '!\%#',                                      'input' : '= '}) 
"      call smartinput#define_rule({ 'char' : '=', 'at' : '^\([^"]*"[^"]*"\)*[^"]*"[^"]*\%#',          'input' : '='}) 
"      call smartinput#define_rule({ 'char' : '=', 'at' : '^\([^'']*''[^'']*''\)*[^'']*''[^'']*\%#',   'input' : '='}) 
"  
"  
"      call smartinput#map_to_trigger('i', '<BS>', '<BS>', '<BS>') 
"      call smartinput#define_rule({ 'char' : '<BS>' , 'at' : '(\s*)\%#'   , 'input' : '<C-O>dF(<BS>'}) 
"      call smartinput#define_rule({ 'char' : '<BS>' , 'at' : '{\s*}\%#'   , 'input' : '<C-O>dF{<BS>'}) 
"      call smartinput#define_rule({ 'char' : '<BS>' , 'at' : '<\s*>\%#'   , 'input' : '<C-O>dF<<BS>'}) 
"      call smartinput#define_rule({ 'char' : '<BS>' , 'at' : '\[\s*\]\%#' , 'input' : '<C-O>dF[<BS>'}) 
"  
"  
"      for op in ['<', '>', '+', '-', '/', '&', '%', '\*', '|'] 
"          call smartinput#define_rule({ 'char' : '<BS>' , 'at' : ' ' . op . ' \%#' , 'input' : '<BS><BS><BS>'}) 
"      endfor 
"NeoBundle "fuenor/jpformat"
"    set formatexpr=jpfmt#formatexpr()
"NeoBundle "kovisoft/slimv"
"    let g:slimv_python = '/usr/bin/python.exe'
"    let g:slimv_swank_cmd ='/usr/bin/clisp.exe --load "~/.vim/bundle/slimv/slime/start-swank.lisp"'
" vimrc に記述されたプラグインでインストールされていないものがないかチェックする
NeoBundleCheck

call neobundle#end()

filetype plugin indent on
" どうせだから jellybeans カラースキーマを使ってみましょう
set t_Co=256
let g:solarized_termcolors=256
syntax on
colorscheme jellybeans
set background=dark
"set background=light
"colorscheme solarized
"colorscheme molokai
"set list
set number
set ts=4
set nowrap
set listchars=tab:»-,trail:-,extends:»,precedes:«,nbsp:%,eol:↲
set expandtab
set tabstop=4
set shiftwidth=4
set softtabstop=0
set smarttab
" バックスペースでなんでも消せるようにする
set backspace=indent,eol,start
set ruler
set cursorline
set laststatus=2
set incsearch
set mouse=a
set ttymouse=xterm2
