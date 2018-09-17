call plug#begin('~/.vim/plugged')

"Plug 'sheerun/vim-polyglot'
Plug 'https://github.com/Shougo/vimproc.vim'
Plug 'https://github.com/idanarye/vim-vebugger.git'
Plug 'vim-syntastic/syntastic'
Plug 'junegunn/vim-easy-align'
Plug 'rust-lang/rust.vim'
Plug 'racer-rust/vim-racer'
Plug 'cespare/vim-toml'
Plug 'itchyny/lightline.vim'
Plug 'fholgado/minibufexpl.vim'
Plug 'Yggdroot/indentLine'
Plug 'majutsushi/tagbar'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'https://github.com/tommcdo/vim-lion.git'
Plug 'nathanaelkane/vim-indent-guides'
Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
Plug 'yianwillis/vimcdoc'

call plug#end()
