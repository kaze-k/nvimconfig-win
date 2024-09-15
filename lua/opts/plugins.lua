local M = {}

M.plugins = {

  -- ********************* --
  -- *      插件列表     * --
  -- ********************* --

  -- NOTE: == 工具 ==
  --
  -- vim中文文档
  {
    "yianwillis/vimcdoc",
    event = "VimEnter",
  },

  -- 翻译工具
  {
    "voldikss/vim-translator",
    event = "VeryLazy",
  },

  -- 文件管理器
  {
    "nvim-tree/nvim-tree.lua",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = true,
    event = "VimEnter",
  },

  -- 快捷键提示
  {
    "folke/which-key.nvim",
    config = true,
    event = "VeryLazy"
  },

  -- zen模式
  {
    "folke/zen-mode.nvim",
    config = true,
    cmd = "ZenMode",
  },

  -- 查看撤销
  {
    "mbbill/undotree",
    cmd = "UndotreeToggle",
  },

  -- 行号跳转
  {
    "nacro90/numb.nvim",
    config = true,
    event = "CmdlineEnter",
  },

  -- 缓冲区切换
  {
    "matbme/JABS.nvim",
    config = true,
    cmd = "JABSOpen",
  },

  -- 窗户排列
  {
    "sindrets/winshift.nvim",
    config = true,
    cmd = "WinShift",
  },

  -- 回到最后修改的位置
  {
    "ethanholz/nvim-lastplace",
    config = true,
    event = "VimEnter",
  },

  -- Telescope
  {
    "nvim-telescope/telescope.nvim",
    branch = "0.1.x",
    dependencies = { "nvim-lua/plenary.nvim" },
    opts = {
      defaults = {
        file_ignore_patterns = { "node_modules", ".git" },
      },
      find_files = { hidden = true },
    },
    event = "VimEnter",
  },

  -- buffer删除优化
  {
    "famiu/bufdelete.nvim",
    event = "BufEnter",
  },

  -- NOTE: == UI ==
  --
  -- 图标
  {
    "nvim-tree/nvim-web-devicons",
    -- event = "VimEnter",
  },

  -- 滚动动效
  {
    "echasnovski/mini.animate",
    config = true,
    event = "VimEnter",
  },

  -- 输入框美化
  {
    "stevearc/dressing.nvim",
    config = true,
    event = "VeryLazy",
  },

  -- 状态栏
  {
    "nvim-lualine/lualine.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = true,
    -- event = "VeryLazy",
  },

  -- buffer栏
  {
    "akinsho/bufferline.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = true,
    -- event = "VeryLazy",
  },

  -- colorcolumn
  {
    "m4xshen/smartcolumn.nvim",
    config = true,
    event = "VeryLazy",
  },

  -- 滚动条
  {
    "petertriho/nvim-scrollbar",
    config = true,
    event = "VeryLazy",
  },

  -- NOTE: == 注释 ==
  --
  -- tode注释
  {
    "folke/todo-comments.nvim",
    config = true,
    event = "BufEnter",
  },

  -- 快捷注释
  {
    "numToStr/Comment.nvim",
    opts = {
      toggler = {
        line = "<C-_>",
        block = "<Leader><C-_>",
      }
    },
    event = "BufEnter",
  },

  -- -- NOTE: == 代码编辑 ==
  -- --
  -- 选择代码块
  {
    "gcmt/wildfire.vim",
    event = "BufEnter",
  },

  -- 颜色标注
  {
    "norcalli/nvim-colorizer.lua",
    config = true,
    event = "VeryLazy",
  },

  -- 缩进线
  {
    "lukas-reineke/indent-blankline.nvim",
    config = function() require("ibl").setup() end,
    event = "BufEnter",
  },

  -- 彩虹括号
  {
    "HiPhish/rainbow-delimiters.nvim",
    dependencies = { "nvim-treesitter/nvim-treesitter" },
    config = function() require("rainbow-delimiters.setup").setup() end,
    event = "BufEnter",
  },

  -- 高亮相同单词
  {
    "RRethy/vim-illuminate",
    event = "BufEnter",
  },

  -- 括号自动匹配
  {
    "windwp/nvim-autopairs",
    config = true,
    event = "InsertEnter",
  },

  -- 包裹符号修改
  {
    "kylechui/nvim-surround",
    config = true,
    event = "VeryLazy",
  },

  -- 多光标
  {
    "mg979/vim-visual-multi",
    event = "VeryLazy",
  },

  -- 快速跳转
  {
    "phaazon/hop.nvim",
    config = true,
    event = "VeryLazy",
  },

  -- 代码折叠
  {
    "kevinhwang91/nvim-ufo",
    dependencies = { "kevinhwang91/promise-async" },
    config = true,
    event = "VimEnter",
  },

  -- 反转文本
  {
    "nguyenvukhang/nvim-toggler",
    config = true,
    event = "BufEnter",
  },

  -- NOTE: == Git ==
  --
  -- git工具
  {
    "TimUntersberger/neogit",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-telescope/telescope.nvim",
      "sindrets/diffview.nvim",
    },
    config = true,
    cmd = { "Neogit" },
  },

  -- git功能集合
  {
    "lewis6991/gitsigns.nvim",
    config = true,
    event = "VeryLazy",
  },

  -- git diff工具
  {
    "sindrets/diffview.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
    config = true,
    cmd = { "DiffviewOpen", "DiffviewFileHistory" },
  },

  -- git冲突解决
  {
    "akinsho/git-conflict.nvim",
    config = true,
    event = "BufReadPre",
  },

  -- NOTE: == 代码补全 ==
  --
  -- coc
  {
    "neoclide/coc.nvim",
    build = "npm ci",
    config = function() require("config.coc") end,
    event = "VimEnter",
  },

  -- NOTE: == 终端 ==
  --
  -- 多终端
  {
    "akinsho/toggleterm.nvim",
    config = true,
    event = "VeryLazy",
  },
}

return M.plugins
