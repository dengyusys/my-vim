" 禁用 vi 兼容模式
set nocompatible

" 设置GVIM下字体和大小
set guifont=JetBrainsMono\ NFM\ Regular:h12

" 设置 Backspace 键模式
set backspace=indent,eol,start

"----------------------------------------------------------------------
" 搜索设置
"----------------------------------------------------------------------

" 搜索时忽略大小写
set ignorecase

" 智能搜索大小写判断，默认忽略大小写，除非搜索内容包含大写字母
set smartcase

" 高亮搜索内容
set hlsearch

" 查找输入时动态增量显示查找结果
set incsearch

" 默认字符编码设置为UTF8
set encoding=utf8

inoremap jj <Esc>

" easymotion 配置
map <Leader> <Plug>(easymotion-prefix)
map <Leader><Leader>w <Plug>(easymotion-w)


" NERDTree key mappings
noremap <space>nn :NERDTree<CR>
noremap <space>no :NERDTreeFocus<CR>
noremap <space>nf :NERDTreeFind<CR>
noremap <space>nt :NERDTreeToggle<CR>
noremap <space>nm :NERDTreeMirror<CR>

" 启用匹配插件，可以配置html标签
:packadd! matchit


call plug#begin()
  Plug 'mhinz/vim-startify'
  Plug 'preservim/nerdtree'
  Plug 'easymotion/vim-easymotion'
  Plug 'tpope/vim-surround'
  Plug 'tpope/vim-commentary'
  Plug 'mg979/vim-visual-multi'
  Plug 'vim-airline/vim-airline'
  Plug 'vim-airline/vim-airline-themes'
  Plug 'skywind3000/asyncrun.vim'
  Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
  Plug 'junegunn/fzf.vim'
call plug#end()
