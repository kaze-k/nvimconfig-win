local M = {}

M.config = {
  root = vim.fn.stdpath("data") .. "/lazy",
  defaults = {
    lazy = false,
    version = nil,
    cond = nil,
  },
  spec = nil,
  lockfile = vim.fn.stdpath("config") .. "/lazy-lock.json",
  concurrency = jit.os:find("Linux") and (vim.loop.available_parallelism() * 2) or 5,
  git = {
    log = { "-8" },
    timeout = 120,
    url_format = "https://github.com/%s.git",
    filter = true,
  },
  dev = {
    path = vim.fn.stdpath("config") .. "/plugins",
    patterns = {},
    fallback = false,
  },
  install = {
    missing = true,
    colorscheme = {},
  },
  ui = {
    size = { width = 0.8, height = 0.8 },
    wrap = true,
    border = "rounded",
    title = nil,
    title_pos = "center",
    pills = true,
    icons = {
      cmd = " ",
      config = "",
      event = "",
      ft = " ",
      init = " ",
      import = " ",
      keys = " ",
      lazy = "󰒲 ",
      loaded = "●",
      not_loaded = "○",
      plugin = " ",
      runtime = " ",
      require = "󰢱 ",
      source = " ",
      start = "",
      task = "✔ ",
      list = {
        "●",
        "➜",
        "★",
        "‒",
      },
    },
    browser = nil,
    throttle = 20,
    custom_keys = {
      ["<localleader>l"] = {
        function(plugin)
          require("lazy.util").float_term({ "lazygit", "log" }, {
            cwd = plugin.dir,
          })
        end,
        desc = "Open lazygit log",
      },

      ["<localleader>t"] = {
        function(plugin)
          require("lazy.util").float_term(nil, {
            cwd = plugin.dir,
          })
        end,
        desc = "Open terminal in plugin dir",
      },
    },
  },
  diff = {
    cmd = "diffview.nvim",
  },
  checker = {
    enabled = true,
    concurrency = nil,
    notify = false,
    frequency = 30 * 24 * 60 * 60,
    check_pinned = false,
  },
  change_detection = {
    enabled = true,
    notify = true,
  },
  performance = {
    cache = {
      enabled = true,
    },
    reset_packpath = true,
    rtp = {
      reset = true,
      paths = {},
      disabled_plugins = {
        -- "gzip",
        -- "matchit",
        -- "matchparen",
        -- "netrwPlugin",
        -- "tarPlugin",
        -- "tohtml",
        -- "tutor",
        -- "zipPlugin",
      },
    },
  },
  readme = {
    enabled = true,
    root = vim.fn.stdpath("state") .. "/lazy/readme",
    files = { "README.md", "lua/**/README.md" },
    skip_if_doc_exists = true,
  },
  state = vim.fn.stdpath("state") .. "/lazy/state.json",
  build = {
    warn_on_override = false,
  },
  profiling = {
    loader = false,
    require = false,
  },
  debug = false,
}

return M
