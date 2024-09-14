local map = vim.keymap.set
local opts = { noremap = true, silent = true }

-- 切换全屏
vim.api.nvim_create_user_command(
  "NeovideToggleFullScreen",
  function() vim.g.neovide_fullscreen = not vim.g.neovide_fullscreen end,
  {}
)

-- neovide功能键
map({ "n", "v", "i", "c" }, "<F11>", "<Cmd>NeovideToggleFullScreen<CR>", opts)

-- neovide粘贴
map("v", "<C-v>", [["+P]], opts) -- 可视模式粘贴
map("c", "<C-v>", [[<C-R>+]], opts) -- 命令模式粘贴
map("i", "<C-v>", [[<C-R>+]], opts) -- 插入模式粘贴

-- neovide特定按键
map({ "n", "v" }, "<C-/>", "<C-_>", { noremap = true, silent = true, remap = true })
map({ "n", "v" }, "<Leader><C-/>", "<Leader><C-_>", { noremap = true, silent = true, remap = true })
