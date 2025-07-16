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

" 显示行号
set number

" tab
set shiftwidth=2
set softtabstop=2
set noexpandtab
set tabstop=2


" 关闭备份功能，因为大多数项目使用 SVN、Git 等版本控制...
" 不创建备份文件（默认 .bak 后缀）
set nobackup

" 不写入备份文件（覆盖原有文件时）
set nowb

" 检测是否有外部修改 自动重读
set autoread

" 不创建交换文件（默认 .swp 后缀）     
set noswapfile   

" 光标调整
" let &t_SI = "\e[6 q"
" let &t_EI = "\e[2 q"

" 键位映射
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

"----------------------------------------------------------------------
" Dirvish 设置：自动排序并隐藏文件，同时定位到相关文件
" 这个排序函数可以将目录排在前面，文件排在后面，并且按照字母顺序排序
" 比默认的纯按照字母排序更友好点。
" ----------------------------------------------------------------------
function! s:setup_dirvish()
	if &buftype != 'nofile' && &filetype != 'dirvish'
		return
	endif
	if has('nvim')
		return
	endif
	" 取得光标所在行的文本（当前选中的文件名）
	let text = getline('.')
	if ! get(g:, 'dirvish_hide_visible', 0)
		exec 'silent keeppatterns g@\v[\/]\.[^\/]+[\/]?$@d _'
	endif
	" 排序文件名
	exec 'sort ,^.*[\/],'
	let name = '^' . escape(text, '.*[]~\') . '[/*|@=|\\*]\=\%($\|\s\+\)'
	" 定位到之前光标处的文件
	call search(name, 'wc')
	noremap <silent><buffer> ~ :Dirvish ~<cr>
	noremap <buffer> % :e %
endfunc

augroup MyPluginSetup
	autocmd!
	autocmd FileType dirvish call s:setup_dirvish()
augroup END

" 将默认shellg改为powershell
let g:terminal_shell = 'pwsh'

call plug#begin()
  Plug 'mhinz/vim-startify'
  Plug 'vim-airline/vim-airline'
  Plug 'vim-airline/vim-airline-themes'
  Plug 'preservim/nerdtree'
	Plug 'justinmk/vim-dirvish'
  Plug 'easymotion/vim-easymotion'
  Plug 'tpope/vim-surround'
  Plug 'tpope/vim-commentary'
  Plug 'mg979/vim-visual-multi'
  Plug 'skywind3000/asyncrun.vim'
  Plug 'skywind3000/vim-terminal-help'
	Plug 'Yggdroot/LeaderF', { 'do': ':LeaderfInstallCExtension' }
	Plug 'junegunn/fzf'
call plug#end()
