local map = vim.api.nvim_set_keymap
local keymap = vim.keymap.set
local opts = {
  noremap = true,
  silent = true,
}

------------------
-- nvim 基本按键--
------------------
-- map("n", " ", "<NOP>", opts) -- 设置空格没有动作
map("i", "<C-q>", "<ESC>:q", { noremap = true, silent = false }) -- 退出
map("i", "<C-s>", "<ESC>:w", { noremap = true, silent = false }) -- 保存
map("n", "<Leader>bn", "<Cmd>bn<CR>", opts) -- 切换下一个buffer
map("n", "<Leader>bp", "<Cmd>bp<CR>", opts) -- 切换上一个buffer
map("n", "<Leader>bd", "<Cmd>Bdelete<CR>", opts) -- 删除buffer
map("n", "<Leader>tn", "<Cmd>tabn<CR>", opts) -- 切换下一个tab
map("n", "<Leader>tp", "<Cmd>tabp<CR>", opts) -- 切换下一个tab
map("n", "<Leader>td", "<Cmd>tabclose<CR>", opts) -- 删除tab
map("n", "<Leader>te", ":tabe<Space>", { noremap = true, silent = false }) -- 新建tab
map("n", "<Leader>be", ":e<Space>", { noremap = true, silent = false }) -- 新建buffer
map("n", "<Leader>v", ":vsp<Space>", { noremap = true, silent = false }) -- 纵向分屏
map("n", "<Leader>p", ":sp<Space>", { noremap = true, silent = false }) -- 横向分屏
map("n", "<Leader>n", "<Cmd>nohl<CR>", opts) -- 取消高亮
map("n", "<Leader>N", "<Cmd>setlocal number! | setlocal relativenumber!<CR>", opts) -- 切换行号
map("n", "<A-Up>", "<Cmd>resize +1<CR>", opts) -- 分屏下方调整
map("n", "<A-Down>", "<Cmd>resize -1<CR>", opts) -- 分屏上方调整
map("n", "<A-Right>", "<Cmd>vertical resize -1<CR>", opts) -- 分屏左方调整
map("n", "<A-Left>", "<Cmd>vertical resize +1<CR>", opts) -- 分屏右方调整
map("n", "<A-h>", "<Cmd>resize<CR>", opts) -- 分屏调整最大高度
map("n", "<A-w>", "<Cmd>vertical resize<CR>", opts) -- 分屏调整最大宽度
map("n", "<C-w>m", "<Cmd>resize | vertical resize<CR>", opts) -- 分屏调整最大高度和宽度
map("t", "<ESC>n", [[<C-\><C-n>]], opts) -- 终端模式下退出输入模式

-------------
-- 插件按键--
-------------

-- lazy
map("n", "<A-h>", "<Cmd>Lazy home<CR>", opts)

-- alpha
map("n", "<Leader>A", "<Cmd>Alpha<CR>", opts)

-- nvim-tree
map("n", "<Leader>F", "<Cmd>NvimTreeToggle<CR>", opts)
map("n", "<Leader>I", "<Cmd>NvimTreeFindFile<CR>", opts)

-- todo-comments
map("n", "<Leader>dq", "<Cmd>TodoQuickFix<CR>", opts)
map("n", "<Leader>dl", "<Cmd>TodoLocList<CR>", opts)
map("n", "<Leader>ft", "<Cmd>TodoTelescope<CR>", opts)

-- git-confiict
map("n", "<Leader>gco", "<Plug>(git-conflict-ours)", opts)
map("n", "<Leader>gct", "<Plug>(git-conflict-theirs)", opts)
map("n", "<Leader>gcb", "<Plug>(git-conflict-both)", opts)
map("n", "<Leader>gcn", "<Plug>(git-conflict-none)", opts)
map("n", "<Leader>gx", "<Cmd>GitConflictListQf<CR>", opts)
map("n", "]x", "<Plug>(git-conflict-prev-conflict)", opts)
map("n", "[x", "<Plug>(git-conflict-next-conflict)", opts)

-- gitsigns
map("n", "<leader>gl", "<Cmd>Gitsigns setqflist<CR>", opts)
map("n", "<leader>gp", "<Cmd>Gitsigns preview_hunk_inline<CR>", opts)
map("n", "<leader>gh", "<Cmd>Gitsigns toggle_linehl<CR>", opts)
map("n", "<leader>gd", "<Cmd>Gitsigns diffthis<CR>", opts)
map("n", "<leader>grb", "<Cmd>Gitsigns reset_buffer<CR>", opts)
map("n", "<leader>grh", "<Cmd>Gitsigns reset_hunk<CR>", opts)
map("n", "[h", "<Cmd>Gitsigns next_hunk<CR>", opts)
map("n", "]h", "<Cmd>Gitsigns prev_hunk<CR>", opts)

-- diffview
map("n", "<Leader>do", "<Cmd>DiffviewOpen<CR>", opts)
map("n", "<Leader>dh", "<Cmd>DiffviewFileHistory<CR>", opts)

-- neogit
map("n", "<Leader><Leader>G", "<Cmd>Neogit<CR>", opts)

-- toggleterm
map("n", "<C-j>", "<Cmd>ToggleTerm<CR>", opts) -- 打开\关闭默认终端
map("t", "<C-j>", "<Cmd>ToggleTerm<CR>", opts) -- 打开\关闭默认终端
map("n", "<Leader>q1", "<Cmd>ToggleTerm direction=horizontal<CR>", opts) -- 在下方打开终端
map("n", "<Leader>q2", "<Cmd>ToggleTerm direction=float<CR>", opts) -- 打开浮动终端
map("n", "<Leader>q3", "<Cmd>ToggleTerm direction=vertical<CR>", opts) -- 打开侧边终端
map("n", "<Leader>q4", "<Cmd>ToggleTerm direction=tab<CR>", opts) -- 打开窗户终端
map("n", "<Leader>qa", "<Cmd>ToggleTermToggleAll<CR>", opts) -- 打开或关闭所有终端
map("n", "<Leader>qe", ":TermExec<Space>", {}) -- 打开其他终端来执行命令

-- telescope
map("n", "<Leader>fa", "<Cmd>Telescope<CR>", opts)
map("n", "<Leader>fk", "<Cmd>Telescope keymaps<CR>", opts) -- 查找按键映射
map("n", "<Leader>fs", "<Cmd>Telescope search_history<CR>", opts) -- 历史搜索
map("n", "<Leader>fC", "<Cmd>Telescope command_history<CR>", opts) -- 历史命令
map("n", "<Leader>ff", "<Cmd>Telescope find_files<CR>", opts) -- 查找文件
map("n", "<Leader>fg", "<Cmd>Telescope live_grep<CR>", opts) -- 搜索文字
map("n", "<Leader>fb", "<Cmd>Telescope buffers<CR>", opts) -- 选择buffer
map("n", "<Leader>fh", "<Cmd>Telescope help_tags<CR>", opts) -- 搜索帮助
map("n", "<Leader>fl", "<Cmd>Telescope colorscheme<CR>", opts) -- 选择主题
map("n", "<Leader>fo", "<Cmd>Telescope oldfiles<CR>", opts) -- 历史文件
map("n", "<Leader>fc", "<Cmd>Telescope commands<CR>", opts) -- 查找命令

-- winshift
map("n", "<Leader><C-w>", "<Cmd>WinShift<CR>", opts)
map("n", "<C-w>x", "<Cmd>WinShift swap<CR>", opts)
map("n", "<C-A-Left>", "<Cmd>WinShift left<CR>", opts)
map("n", "<C-A-Down>", "<Cmd>WinShift down<CR>", opts)
map("n", "<C-A-Up>", "<Cmd>WinShift up<CR>", opts)
map("n", "<C-A-Right>", "<Cmd>WinShift right<CR>", opts)

-- whichkey
map("n", "<Leader>?", "<Cmd>WhichKey<CR>", opts)

-- hop
map("n", "<Leader>w", "<Cmd>HopWord<CR>", opts)
map("n", "<Leader>l", "<Cmd>HopLine<CR>", opts)
map("n", "<Leader>a", "<Cmd>HopAnywhere<CR>", opts)

-- zen-mode
map("n", "<Leader>Z", "<Cmd>ZenMode<CR>", opts)

-- JABS
map("n", "<Leader>J", "<Cmd>JABSOpen<CR>", opts)

-- undotree
map("n", "<Leader>u", "<Cmd>UndotreeToggle<CR>", opts)

-- vim-translator
map("n", "<Leader>Tw", "<Plug>TranslateW", opts)
map("v", "<Leader>Tw", "<Plug>TranslateWV", opts)
map("n", "<Leader>Tt", "<Plug>Translate", opts)
map("v", "<Leader>Tt", "<Plug>TranslateV", opts)
map("n", "<Leader>Tx", "<Plug>TranslateX", opts)
map("n", "<Leader>Th", "<Cmd>TranslateH<CR>", opts)

-- nvim-ufo
map("n", "zR", "<Cmd>lua require('ufo').openAllFolds()<CR>", opts)
map("n", "zM", "<Cmd>lua require('ufo').closeAllFolds()<CR>", opts)

-- nvim-toggler
map("n", "<Leader>i", "<Cmd>lua require('nvim-toggler').toggle()<CR>", opts)
map("v", "<Leader>i", "<Cmd>lua require('nvim-toggler').toggle()<CR>", opts)

-- bufferline
map("n", "<Leader>1", "<Cmd>BufferLineGoToBuffer 1<CR>", { silent = true })
map("n", "<Leader>2", "<Cmd>BufferLineGoToBuffer 2<CR>", { silent = true })
map("n", "<Leader>3", "<Cmd>BufferLineGoToBuffer 3<CR>", { silent = true })
map("n", "<Leader>4", "<Cmd>BufferLineGoToBuffer 4<CR>", { silent = true })
map("n", "<Leader>5", "<Cmd>BufferLineGoToBuffer 5<CR>", { silent = true })
map("n", "<Leader>6", "<Cmd>BufferLineGoToBuffer 6<CR>", { silent = true })
map("n", "<Leader>7", "<Cmd>BufferLineGoToBuffer 7<CR>", { silent = true })
map("n", "<Leader>8", "<Cmd>BufferLineGoToBuffer 8<CR>", { silent = true })
map("n", "<Leader>9", "<Cmd>BufferLineGoToBuffer 9<CR>", { silent = true })
map("n", "]b", "<Cmd>BufferLineCycleNext<CR>", { silent = true })
map("n", "[b", "<Cmd>BufferLineCyclePrev<CR>", { silent = true })
map("n", "<Leader>]b", "<Cmd>BufferLineMoveNext<CR>", { silent = true })
map("n", "<Leader>[b", "<Cmd>BufferLineMovePrev<CR>", { silent = true })
map("n", "<Leader>bse", "<Cmd>BufferLineSortByExtension<CR>", { silent = true })
map("n", "<Leader>bsd", "<Cmd>BufferLineSortByDirectory<CR>", { silent = true })
map("n", "<Leader>bc", "<Cmd>BufferLinePick<CR>", { silent = true })
map("n", "<Leader>bC", "<Cmd>BufferLinePickClose<CR>", { silent = true })
