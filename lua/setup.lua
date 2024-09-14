-- 设置本地变量
local set = vim.opt
local cmd = vim.api.nvim_command

------------------
-- nvim 基本设置--
------------------

-- 设置中文帮助
set.helplang = "cn"

-- 加载插件设置
-- vim.opt.loadplugins = true

-- 设置剪切板
-- set.clipboard = "unnamedplus"

-- 设置文件编码
set.fileencoding = "utf-8"

-- 设置字体
set.guifont = "monospace:h17"

-- 设置光标
set.guicursor = "n-c-sm:block-Cursor"
set.guicursor = set.guicursor + "i-ci-ve:ver25-Cursor"
set.guicursor = set.guicursor + "r-cr:hor20-Cursor"
set.guicursor = set.guicursor + "o-v:block-Cursor-blinkwait300-blinkon200-blinkoff150"

-- 设置提示信息
set.shortmess = "filnxtToOFImwsc"

-- 设置行号
set.number = true

-- 设置行号列宽度
set.numberwidth = 4

-- 开启拼写检查
-- set.spell = true

-- 拼写检查的语言
-- set.spelllang = { "en", "cjk" }

-- 设置相对行号
set.relativenumber = true

-- 高亮所在行
set.cursorline = true

-- 高亮所在列
set.cursorcolumn = false

-- 设置响应时间(单位/ms)
set.updatetime = 100

-- 设置按键完成时间(单位/ms)
set.timeoutlen = 500

-- 显示输入的快捷键
set.showcmd = true

-- 命令选项
set.wildmenu = true

-- 设置鼠标
set.mouse = "a"

-- 颜色
set.termguicolors = true

-- 自动缩进
set.autoindent = true

-- 智能case
set.smartcase = true

-- 智能缩进
set.smartindent = true

-- 智能tab
set.smarttab = true

-- 设置tab键
set.expandtab = true
set.tabstop = 2
set.shiftwidth = 2
set.softtabstop = 2

-- 可视模式下进行代码块复制
set.virtualedit = "block"

-- 自动换行
set.wrap = true

-- 在符号处换行
set.linebreak = true

-- 垂直滚动，光标距离行底和行顶5行
set.scrolloff = 5

-- 括号高亮
-- set.showmatch = true

-- 高亮匹配结果
set.hlsearch = true

-- 搜索自动跳转到第一个
set.incsearch = true

-- 搜索忽略大小写
set.ignorecase = true

-- 保留撤销历史
set.undofile = true

-- 设置历史文件夹
-- cmd([[ set undodir=~/.config/nvim/.undo// ]])

-- 设置备份文件夹
-- cmd([[ set backupdir=~/.config/nvim/.backup// ]])

-- 设置交换文件夹
-- cmd([[ set directory=~/.config/nvim/.swp// ]])

-- 设置历史操作记录
set.history = 1000

-- 显示末尾空格字符
set.list = true

-- 设置tab、空格、回车等字符
set.listchars:append("tab:——")
set.listchars:append("trail:·")
set.listchars:append("space:⋅")
set.listchars:append("eol:↴")
set.listchars:append("extends:→")
set.listchars:append("precedes:←")
set.showbreak = "↳ "

-- 文件内容自动加载
set.autoread = true

-- 设置leader键
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- 关闭后打开回到之前的位置
-- cmd[[ autocmd BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif ]]

-- 设置参考线
-- set.colorcolumn = "120"

-- 显示符号列
set.signcolumn = "yes"

-- 行结尾可以跳到下一行
-- set.whichwrap = 'b,s,<,>,[,],h,l'

-- 设置pop up menu高度
set.pumheight = 10

-- 命令预览
set.inccommand = "split"

-- 设置命令行高
set.cmdheight = 1

-- 显示模式
set.showmode = true

-- 显示tabline
-- set.showtabline = 2

-- statusline设置
set.laststatus = 3

-- 开启/关闭代码折叠(zo 打开折叠/zc 关闭折叠/za 切换)
set.foldenable = true

-- 设置折叠列
set.foldcolumn = "1"

-- 设置填充字符
vim.o.fillchars = [[eob: ,fold: ,foldopen:,foldsep: ,foldclose:]]

-- 设置折叠(syntax, indent, manual)
set.foldmethod = "manual"

-- 设置折叠等级
set.foldlevel = 99

-- 补全菜单设置
set.completeopt = "menu,menuone,noinsert,noselect"
-- set.pumblend = 15

-- 设置session选项
set.sessionoptions = "curdir,folds,help,winsize,terminal,winpos"

-- diff模式设置
set.diffopt = "vertical,filler,internal,context:4"

-- 强制水平拆分到下方
set.splitbelow = true

-- 强制垂直拆分到右边
set.splitright = true

-- 拆分后的光标滚动行为
set.splitkeep = "cursor"

-- providers
vim.g.loaded_ruby_provider = 0
vim.g.loaded_node_provider = 0
vim.g.loaded_perl_provider = 0
