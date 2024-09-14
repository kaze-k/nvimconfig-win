-- coc预安装插件
vim.g.coc_global_extensions = {
  "coc-tsserver",
  "coc-html",
  "coc-css",
  "coc-json",
  "coc-yank",
  "coc-snippets",
  "coc-marketplace",
  "coc-lightbulb",
  "coc-vetur",
}

local map = vim.keymap.set
local opts = {
  noremap = true,
  silent = true,
}
local expr_opts = {
  noremap = true,
  silent = true,
  expr = true,
  replace_keycodes = false,
}

-- coc-lightbulb
vim.api.nvim_set_hl(0, "LightBulbDefaultVirtualText", { fg = "#FDD164" })
vim.api.nvim_set_hl(0, "LightBulbQuickFixVirtualText", { link = "LightBulbDefaultVirtualText" })
vim.api.nvim_set_hl(0, "LightBulbDefaultSign", { fg = "#FDD164" })
vim.api.nvim_set_hl(0, "LightBulbQuickFixSign", { link = "LightBulbDefaultSign" })

-- coc-yank设置
vim.api.nvim_set_hl(0, "HighlightedyankRegion", { blend = 50, bold = true, standout = true, reverse = true })

-- coc设置
function _G.check_back_space()
  local col = vim.fn.col(".") - 1
  return col == 0 or vim.fn.getline("."):sub(col, col):match("%s") ~= nil
end

function _G.show_docs()
  local cw = vim.fn.expand("<cword>")
  if vim.fn.index({ "vim", "help" }, vim.bo.filetype) >= 0 then
    vim.api.nvim_command("h " .. cw)
  elseif vim.api.nvim_eval("coc#rpc#ready()") then
    vim.fn.CocActionAsync("doHover")
  else
    vim.api.nvim_command("!" .. vim.o.keywordprg .. " " .. cw)
  end
end

vim.api.nvim_create_augroup("CocGroup", {})
vim.api.nvim_create_autocmd("CursorHold", {
  group = "CocGroup",
  command = "silent call CocActionAsync('highlight')",
  desc = "Highlight symbol under cursor on CursorHold",
})

vim.api.nvim_create_autocmd("User", {
  group = "CocGroup",
  pattern = "CocJumpPlaceholder",
  command = "call CocActionAsync('showSignatureHelp')",
  desc = "Update signature help on jump placeholder",
})

vim.api.nvim_create_user_command("Format", "call CocAction('format')", {})
vim.api.nvim_create_user_command("Fold", "call CocAction('fold', <f-args>)", { nargs = "?" })
vim.api.nvim_create_user_command("OR", "call CocActionAsync('runCommand', 'editor.action.organizeImport')", {})

-- 按键映射
-- coc
-- 基础按键
-- 正常模式
map("n", "<Leader>D", ":<C-u>CocList diagnostics<CR>", opts) -- 查看所有报错
map("n", "<Leader>x", "<Cmd>CocList extensions<CR>", opts) -- 管理插件
map("n", "<Leader>C", "<Cmd>CocConfig<CR>", opts) -- 编辑配置
map("n", "K", "<Cmd>lua _G.show_docs()<CR>", opts) -- 查看文档
map("n", "gd", "<Plug>(coc-definition)", { silent = true }) -- 跳转到函数定义
map("n", "gy", "<Plug>(coc-type-definition)", { silent = true }) -- 查看定义类型
map("n", "gi", "<Plug>(coc-implementation)", { silent = true }) -- 跳转到导入
map("n", "gr", "<Plug>(coc-references)", { silent = true }) -- 跳转到调用函数
map("n", "<PageDown>", [[coc#float#has_scroll() ? coc#float#scroll(1) : "<C-f>"]], expr_opts) -- 下滑
map("n", "<PageUp>", [[coc#float#has_scroll() ? coc#float#scroll(0) : "<C-b>"]], expr_opts) -- 上滑
map("i", "<PageDown>", [[coc#float#has_scroll() ? "<c-r>=coc#float#scroll(1)<cr>" : "<Right>"]], expr_opts) -- 下滑
map("i", "<PageUp>", [[coc#float#has_scroll() ? "<c-r>=coc#float#scroll(0)<cr>" : "<Left>"]], expr_opts) -- 上滑
map("n", "<Leader>rn", "<Plug>(coc-rename)", { silent = true }) -- 重命名函数
map("n", "<leader>re", "<Plug>(coc-codeaction-refactor)", { silent = true })
map("n", "[d", "<Plug>(coc-diagnostic-prev)", { silent = true }) -- 跳转到上一个报错
map("n", "]d", "<Plug>(coc-diagnostic-next)", { silent = true }) -- 调整到下一个报错
map("n", "<Leader>ca", "<Plug>(coc-codeaction)", { silent = true }) -- 代码操作
map("n", "<Leader>cl", "<Plug>(coc-codelens-action)", { silent = true }) -- codelens
map("v", "<Leader>fm", "<Plug>(coc-format-selected)", { silent = true }) -- 格式化选中的代码
map("n", "<Leader>fm", "<Cmd>Format<CR>", opts) -- 格式化代码
map("x", "if", "<Plug>(coc-funcobj-i)", opts) -- 作用于函数内容
map("o", "if", "<Plug>(coc-funcobj-i)", opts) -- 作用于函数内容
map("x", "af", "<Plug>(coc-funcobj-a)", opts) -- 作用于整个函数
map("o", "af", "<Plug>(coc-funcobj-a)", opts) -- 作用于整个函数
map("x", "ic", "<Plug>(coc-classobj-i)", opts) -- 作用于类的内容
map("o", "ic", "<Plug>(coc-classobj-i)", opts) -- 作用于类的内容
map("x", "ac", "<Plug>(coc-classobj-a)", opts) -- 作用于整个类
map("o", "ac", "<Plug>(coc-classobj-a)", opts) -- 作用于整个类

-- 输入模式
map(
  "i",
  "<Tab>",
  [[coc#pum#visible() ? coc#pum#next(1) : v:lua.check_back_space() ? "\<Tab>" : coc#refresh()]],
  expr_opts
) -- 使用tab进行补全选择
map("i", "<S-Tab>", [[coc#pum#visible() ? coc#pum#prev(1) : "\<S-Tab>"]], expr_opts) -- 使用<S-TAB>进行补全选择

map("i", "<CR>", [[coc#pum#visible() ? coc#pum#confirm() : "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"]], expr_opts) -- 确定使用
map("i", "<C-j>", "coc#refresh()", { silent = true, expr = true }) -- 触发补全
map("i", "<C-l>", "<Plug>(coc-snippets-expand-jump)", opts) -- 展开代码段

-- coc插件按键
-- marketplace
map("n", "<Leader>m", "<Cmd>CocList marketplace<CR>", opts)

-- yank
map("n", "<Leader>yy", "<Cmd><C-u>CocList -A --normal yank<CR>", opts)
map("n", "<Leader>yc", "<Cmd>CocCommand yank.clean<CR>", opts)
