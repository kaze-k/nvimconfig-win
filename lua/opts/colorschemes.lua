local M = {}

M.plugins = {

  -- ********************* --
  -- *      插件列表     * --
  -- ********************* --

  -- NOTE: == 配色主题 ==
  --
  -- dracula
  {
    "Mofiqul/dracula.nvim",
    -- opts ={},
  },

  -- onenord
  {
    "rmehri01/onenord.nvim",
    -- opts ={},
  },

  -- onedark
  {
    "navarasu/onedark.nvim",
    -- opts ={},
  },

  -- tokyodark
  {
    "tiagovla/tokyodark.nvim",
    opts ={},
  },

  -- tokyonight
  {
    "folke/tokyonight.nvim",
    -- opts ={},
  },

  -- bluloco
  {
    "uloco/bluloco.nvim",
    dependencies = { "rktjmp/lush.nvim" },
    -- opts = {},
  },

  -- gruvbox-baby
  {
    "luisiacc/gruvbox-baby",
    -- opts = {},
  },

  -- zephyr
  {
    "glepnir/zephyr-nvim",
    -- opts = {},
  },

  -- rose-pine
  {
    "rose-pine/neovim",
    name = "rose-pine",
    -- opts = {},
  },

  -- catppuccin
  {
    "catppuccin/nvim",
    name = "catppuccin",
    -- opts = {},
  },
}

return M.plugins
