-- 打开终端关闭行号
local term_group = vim.api.nvim_create_augroup("term-group", { clear = true })
vim.api.nvim_create_autocmd("TermOpen", {
  group = term_group,
  pattern = "*",
  callback = function()
    vim.opt.number = false
    vim.opt.relativenumber = false
  end,
})

-- 自动切换相对行号和绝对行号
local num_group = vim.api.nvim_create_augroup("number-toggle", {})

vim.api.nvim_create_autocmd({ "BufEnter", "FocusGained", "InsertLeave", "CmdlineLeave", "WinEnter" }, {
  pattern = "*",
  group = num_group,
  callback = function(e)
    local special = vim.bo.buftype ~= ""
    if special then
      return
    end

    if vim.o.number and vim.api.nvim_get_mode().mode ~= "i" and vim.api.nvim_get_mode().mode ~= "t" then
      vim.opt.relativenumber = true
    end
    if e.event == "CmdlineEnter" then
      vim.cmd("redraw")
    end
  end,
})

vim.api.nvim_create_autocmd({ "BufLeave", "FocusLost", "InsertEnter", "CmdlineEnter", "WinLeave" }, {
  pattern = "*",
  group = num_group,
  callback = function(e)
    local special = vim.bo.buftype ~= ""
    if special then
      return
    end

    if vim.o.number then
      vim.opt.relativenumber = false
    end
    if e.event == "CmdlineEnter" then
      vim.cmd("redraw")
    end
  end,
})
