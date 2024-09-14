-- 自动下载插件管理器(lazy.nvim)
local lazy_path = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazy_path) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable",
    lazy_path,
  })
end

vim.opt.rtp:prepend(lazy_path)

-- 插件管理器设置
local config = require("config.lazy").config

local ok, lazy = pcall(require, "lazy")
if not ok then
  vim.notify("lazy.nvim 加载失败!", vim.log.levels.ERROR, { title = "lazy.nvim" })
  return
end

local imports = {
  { import = "opts.plugins" },
  { import = "opts.colorschemes" },
}

lazy.setup(imports, config)

-- lazy提示
local lazy_group = vim.api.nvim_create_augroup("Lazy", { clear = true })

vim.api.nvim_create_autocmd("User", {
  group = lazy_group,
  pattern = "LazySync",
  callback = function() vim.notify("Lazy 同步完成!", vim.log.levels.INFO, { title = "lazy.nvim" }) end,
})

vim.api.nvim_create_autocmd("User", {
  group = lazy_group,
  pattern = "LazyClean",
  callback = function() vim.notify("Lazy 清理完成!", vim.log.levels.INFO, { title = "lazy.nvim" }) end,
})
