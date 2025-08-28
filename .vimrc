"======================================================================
" Vim 基础配置
"======================================================================

" 禁用 vi 兼容模式，启用 Vim 高级特性
set nocompatible

" 启用语法高亮
syntax on

" 启用真彩色模式 (24-bit color)
set termguicolors

" 设置颜色主题
colorscheme desert

" 设置字符编码为 UTF-8
set encoding=utf8

" 文件换行符支持 (Unix, DOS, Mac)
set ffs=unix,dos,mac

"----------------------------------------------------------------------
" 界面和显示设置
"----------------------------------------------------------------------

" GVIM 字体设置 (JetBrains Mono Nerd Font)
set guifont=JetBrainsMono\ NFM\ Regular:h14

" 显示行号
set number

" 设置 Backspace 键行为 (允许删除缩进、换行符、插入起始位置之前的字符)
set backspace=indent,eol,start

"----------------------------------------------------------------------
" 搜索配置
"----------------------------------------------------------------------

" 搜索时忽略大小写
set ignorecase

" 智能大小写匹配 (搜索词包含大写字母时区分大小写)
set smartcase

" 高亮显示搜索结果
set hlsearch

" 增量搜索 (输入时实时显示匹配结果)
set incsearch

"----------------------------------------------------------------------
" 代码折叠设置
"----------------------------------------------------------------------

" 启用代码折叠功能
set foldenable

" 使用缩进方式进行折叠
set fdm=indent

" 默认展开所有折叠 (折叠级别99表示不折叠)
set foldlevel=99

"----------------------------------------------------------------------
" 缩进和制表符设置
"----------------------------------------------------------------------

" 制表符宽度为 2 个空格
set tabstop=2

" 自动缩进时的宽度
set shiftwidth=2

" 编辑时按 Tab 键的缩进宽度
set softtabstop=2

" 使用空格代替制表符 (推荐)
set expandtab

" 智能制表符处理
set smarttab

" 自动缩进
set autoindent
set smartindent

"----------------------------------------------------------------------
" 文件处理设置
"----------------------------------------------------------------------

" 禁用备份文件 (.bak)
set nobackup
set nowritebackup

" 禁用写入备份 (覆盖文件时不创建备份)
set nowb

" 自动重新读取外部修改的文件
set autoread

" 禁用交换文件 (.swp)
set noswapfile

"----------------------------------------------------------------------
" 光标样式设置 (注释状态)
"----------------------------------------------------------------------

" 插入模式下光标为垂直线
" let &t_SI = "\e[6 q"

" 普通模式下光标为块状
" let &t_EI = "\e[2 q"

"----------------------------------------------------------------------
" 文件搜索和忽略设置
"----------------------------------------------------------------------

" 忽略特定文件和目录 (用于文件搜索)
set wildignore+=*/node_modules/**,*.git,.git
set wildignore+=*.png,*.jpg,*.gif


"----------------------------------------------------------------------
" Airline 状态栏配置
"----------------------------------------------------------------------

" 启用 Powerline 字体支持
let g:airline_powerline_fonts = 1

" 启用顶部标签栏
let g:airline#extensions#tabline#enabled = 1

"----------------------------------------------------------------------
" EasyMotion 快速跳转配置
"----------------------------------------------------------------------

" 设置 EasyMotion 前缀键为 Leader 键
map <Leader> <Plug>(easymotion-prefix)

"----------------------------------------------------------------------
" NERDTree 文件树配置
"----------------------------------------------------------------------

" 启用简洁界面
let g:NERDTreeMinimalUI = 1

" 启用目录箭头
let g:NERDTreeDirArrows = 1

" 禁用劫持 netrw (内置文件浏览器)
let g:NERDTreeHijackNetrw = 0

" NERDTree 快捷键映射
noremap <space>nn :NERDTree<CR>         " 打开 NERDTree
noremap <space>no :NERDTreeFocus<CR>    " 焦点切换到 NERDTree
noremap <space>nf :NERDTreeFind<CR>     " 在 NERDTree 中定位当前文件
noremap <space>nt :NERDTreeToggle<CR>   " 切换 NERDTree 显示/隐藏
noremap <space>nm :NERDTreeMirror<CR>   " 镜像 NERDTree

"----------------------------------------------------------------------
" 其他内置功能
"----------------------------------------------------------------------

" 启用匹配插件 (支持 HTML 标签等扩展匹配)
packadd! matchit

"----------------------------------------------------------------------
" Dirvish 文件浏览器配置
"----------------------------------------------------------------------

" Dirvish 自动排序和隐藏文件函数
" 将目录排在前面，文件排在后面，按字母顺序排序
function! s:setup_dirvish()
	" 检查是否为 Dirvish 缓冲区
	if &buftype != 'nofile' && &filetype != 'dirvish'
		return
	endif
	
	" 获取当前光标所在行的文件名
	let text = getline('.')
	
	" 隐藏隐藏文件 (以点开头的文件)
	if ! get(g:, 'dirvish_hide_visible', 0)
		exec 'silent keeppatterns g@\v[\/]\.[^\/]+[\/]?$@d _'
	endif
	
	" 按目录优先排序文件列表
	exec 'sort ,^.*[\/],'
	
	" 重新定位到之前选中的文件
	let name = '^' . escape(text, '.*[]~\') . '[/*|@=|\\*]\=\%($\|\s\+\)'
	call search(name, 'wc')
	
	" Dirvish 快捷键映射
	noremap <silent><buffer> ~ :Dirvish ~<cr>  " 跳转到主目录
	noremap <buffer> % :e %                    " 在当前目录新建文件
endfunc

" Dirvish 自动命令组
augroup MyPluginSetup
	autocmd!
	autocmd FileType dirvish call s:setup_dirvish()
augroup END

"----------------------------------------------------------------------
" 终端配置
"----------------------------------------------------------------------

" 设置默认 shell 为 PowerShell (Windows)
let g:terminal_shell = 'pwsh'


"----------------------------------------------------------------------
" LeaderF 模糊搜索配置
"----------------------------------------------------------------------

" 设置 LeaderF 快捷键为 Ctrl+P
let g:Lf_ShortcutF = '<c-p>'

" ALT+n 打开 buffer 模糊匹配
let g:Lf_ShortcutB = '<m-n>'

" CTRL+n 打开最近使用的文件 MRU，进行模糊匹配
noremap <c-n> :LeaderfMru<cr>
  
" ALT+p 打开函数列表，按 i 进入模糊匹配，ESC 退出
noremap <m-p> :LeaderfFunction!<cr>

" 设置 Vue 文件图标
let g:Lf_DevIconsExtensionSymbols = { 'vue': '󰡄' }

"----------------------------------------------------------------------
" Coc.nvim 智能补全配置
"----------------------------------------------------------------------

" Tab 键触发补全和导航
" 如果弹出菜单可见，选择下一项；否则检查退格或触发补全
inoremap <silent><expr> <TAB>
      \ coc#pum#visible() ? coc#pum#next(1) :
      \ CheckBackspace() ? "\<Tab>" :
      \ coc#refresh()

" Shift+Tab 选择上一个补全项
inoremap <expr><S-TAB> coc#pum#visible() ? coc#pum#prev(1) : "\<C-h>"

" Enter 键确认选中的补全项
inoremap <silent><expr> <CR> coc#pum#visible() ? coc#pum#confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

" 检查退格键前是否为空白字符
function! CheckBackspace() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" 代码导航快捷键
nmap <silent><nowait> gd <Plug>(coc-definition)        " 跳转到定义
nmap <silent><nowait> gy <Plug>(coc-type-definition)   " 跳转到类型定义
nmap <silent><nowait> gi <Plug>(coc-implementation)    " 跳转到实现
nmap <silent><nowait> gr <Plug>(coc-references)        " 查看引用

"----------------------------------------------------------------------
" 代码格式化配置
"----------------------------------------------------------------------

" Prettier 格式化命令
command! -nargs=0 Prettier :call CocAction('runCommand', 'prettier.formatFile')

"----------------------------------------------------------------------
" vim-fugitive 配置
"----------------------------------------------------------------------
set diffopt+=vertical


"======================================================================
" 插件管理 (vim-plug)
"======================================================================

call plug#begin()
  " 启动界面
  Plug 'mhinz/vim-startify'
  
  " 状态栏和主题
  Plug 'vim-airline/vim-airline'
  Plug 'vim-airline/vim-airline-themes'
  
  " 文件管理
  Plug 'preservim/nerdtree'              " 文件树
  Plug 'justinmk/vim-dirvish'            " 轻量级文件浏览器
  
  " 编辑增强
  Plug 'easymotion/vim-easymotion'       " 快速跳转
  Plug 'tpope/vim-surround'              " 围绕字符操作 (引号、括号等)
  Plug 'machakann/vim-highlightedyank'   " 高亮复制内容
  Plug 'dengyusys/vue-comment'           " vue 注释插件
  Plug 'tpope/vim-fugitive'              " git 包装器
  
  " 异步执行和终端
  Plug 'skywind3000/asyncrun.vim'        " 异步运行命令
  Plug 'skywind3000/vim-terminal-help'   " 终端增强
  
  " 模糊搜索
  Plug 'Yggdroot/LeaderF', { 'do': ':LeaderfInstallCExtension' }
  
  " 智能补全和语言服务
  Plug 'neoclide/coc.nvim', { 'branch': 'release' }
call plug#end()


