" Common -------------------------------
autocmd!
set nocompatible                        " use vim
let mapleader = " "                     " set mapleader


" External File ------------------------
if filereadable(expand('~/.vimrc.plugin'))
  source ~/.vimrc.plugin
endif

" File ---------------------------------
set autoread                            " 更新時自動再読み込み
set hidden                              " 編集中でも他のファイルを開けるようにする
set noswapfile                          " スワップファイルを作らない
set nobackup                            " バックアップを取らない
set noreadonly                          " リードオンリーにしない
autocmd BufWritePre * :%s/\s\+$//ge     " 保存時に行末の空白を除去する
" autocmd BufWritePre * :%s/\t/  /ge      " 保存時にtabをスペース2つに変換する
syntax on                               " シンタックスカラーリングオン
hi Comment ctermfg=yellow               "コメントを黄色


" Indent -------------------------------
set expandtab                           " tabをスペースに変換
set tabstop=2 shiftwidth=2 softtabstop=0  " tab展開文字数, autoindent時のインデント数,Tabキー押し下げ時の挿入される空白の量，0の場合はtabstopと同じ，BSにも影響する
" set textwidth=78                        " 自動改行する文字位置
set autoindent smartindent              " 自動インデント，スマートインデント
set backspace=indent,eol,start          " バックスペースで特殊記号も削除可能に


" Assist imputting ---------------------
set formatoptions=lmoq                  " 整形オプション，マルチバイト系を追加
set whichwrap=b,s,h,s,<,>,[,]           " カーソルを行頭、行末で止まらないようにする


" Complement Command -------------------
set wildmenu                            " コマンド補完を強化
set wildmode=list:full                  " リスト表示，最長マッチ


" Search -------------------------------
set wrapscan                            " 最後まで検索したら先頭へ戻る
set ignorecase                          " 大文字小文字無視
set smartcase                           " 大文字ではじめたら大文字小文字無視しない
set incsearch                           " インクリメンタルサーチ
set hlsearch                            " 検索文字をハイライト
nmap <ESC><ESC> :nohlsearch<CR>         " ESC2回押しでクリア


" View ---------------------------------
set showmatch                           " 括弧の対応をハイライト
set showcmd                             " 入力中のコマンドを表示
set showmode                            " 現在のモードを表示
set number                              " 行番号表示
set nowrap                              " 画面幅で折り返す
set list                                " 不可視文字表示
set listchars=tab:>\                    " 不可視文字の表示方法
set notitle                             " タイトル書き換えない
set scrolloff=5                         " 行送り
set display=uhex                        " 印字不可能文字を16進数で表示
" set paste                               " ペーストモード(neocomplcacheが動作しない為コメントアウト)


" Change full-pitch space's color ------
hi ZenkakuSpace gui=underline guibg=DarkBlue cterm=underline ctermfg=LightBlue
match ZenkakuSpace /　/


" Set auto cursorline ------------------
augroup vimrc-auto-cursorline
  autocmd!
  autocmd CursorMoved,CursorMovedI,WinLeave * setlocal nocursorline
  autocmd CursorHold,CursorHoldI * setlocal cursorline
augroup END


" Clipboard ----------------------------
if has('clipboard')
  set clipboard+=autoselect
endif


" StatusLine ---------------------------
set laststatus=2                        " ステータスラインを2行に
set statusline=%<%F\ #%n%m%r%h%w%{'['.(&fenc!=''?&fenc:&enc).']['.&ff.']'}%y%=%l,%c%V%8P


" Charset, Line ending -----------------
set termencoding=utf-8
set encoding=utf-8
set fileencodings=iso-2022-jp,utf-8,euc-jp,cp932
set ffs=unix,dos,mac                    " LF, CRLF, CR
if exists('&ambiwidth')
  set ambiwidth=double                " UTF-8の□や○でカーソル位置がずれないようにす
endif


" --------------------------------------
"              my config
" --------------------------------------

"" ファイル名と内容によってファイルタイプを判断し、ファイルタイププラグインを利用する
"filetype plugin on

"ファイルタイプの指定
autocmd! BufRead,BufNewFile *.tt set filetype=html
autocmd! BufRead,BufNewFile *.thtml set filetype=php
autocmd! BufRead,BufNewFile *.ctp set filetype=php
autocmd! BufRead,BufNewFile *.html set filetype=php
autocmd! BufRead,BufNewFile *.t set filetype=perl

"
""TABで候補をリスト表示
"function InsertTabWrapper()
"    let col = col('.') - 1
"    if !col || getline('.')[col - 1] !~ '\k'
"    return "\<tab>"
"    else
"        return "\<c-p>"
"    endif
"endfunction
"inoremap <tab> <c-r>=InsertTabWrapper()<cr>

"perlの整形コマンド
map ,pt :%! perltidy <CR>
map ,ptv :'<,'>! perltidy <CR>

""カーソルを自動的に()の中へ
"map {} {}<Left>
"imap [] []<Left>
"imap () ()<Left>
"imap "" ""<Left>
"imap '' ''<Left>
"imap <> <><Left>
"imap // //<left>
"imap /// ///<left>
"

"NeoBunleの設定
set nocompatible               " Be iMproved
filetype off                   " Required!

if has('vim_starting')
      set runtimepath+=~/.vim/bundle/neobundle.vim/
      call neobundle#rc(expand('~/.vim/bundle/'))
  endif

"NeoBundleプラグイン
NeoBundle 'mattn/zencoding-vim'
NeoBundle 'pangloss/vim-javascript'
NeoBundle 'Shougo/neobundle.vim'
NeoBundle 'Shougo/unite.vim'
NeoBundle 'tomtom/tcomment_vim'
NeoBundle 'Shougo/neocomplcache'
NeoBundle 'scrooloose/nerdtree'

filetype plugin indent on     " Required!

" Installation check.
if neobundle#exists_not_installed_bundles()
  echomsg 'Not installed bundles : ' .
    \ string(neobundle#get_not_installed_bundle_names()
  echomsg 'Please execute ":NeoBundleInstall" command.'
"finish
endif


