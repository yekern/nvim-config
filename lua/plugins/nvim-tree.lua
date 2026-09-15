return {
  "nvim-tree/nvim-tree.lua",
  lazy = false,
  priority = 900, -- 比主题低就行，保证窗口布局先算好
  dependencies = {
    "nvim-tree/nvim-web-devicons",
    "folke/which-key.nvim", -- 顺手声明依赖，让 wk 能吃到 desc
  },
  keys = {
    { "<leader>e", "<cmd>NvimTreeToggle<cr>", desc = "文件树 开/关" },
    { "<leader>E", "<cmd>NvimTreeFindFile<cr>", desc = "文件树 定位当前文件" },
  },
  config = function()
    local nvim_tree = require("nvim-tree")

    nvim_tree.setup({
      sort = { sorter = "case_sensitive" },
      view = {
        width = 30,
        side = "left",
        adaptive_size = false,
        signcolumn = "yes",
      },
      renderer = {
        group_empty = true,
        highlight_git = true,
        indent_markers = { enable = true },
      },
      filters = {
        dotfiles = false,
        custom = { 
          "node_modules",
          "\\.DS_Store$",   -- 匹配任意层级以 .DS_Store 结尾
          "\\.ds_store$",   -- 匹配任意层级以 .ds_store 结尾（以防大小写变体）
          "^\\.git$",       -- 只匹配根目录下的 .git（不碰 .gitignore）
        },
      },
      git = {
        enable = true,
        ignore = false,
      },
      actions = {
        open_file = {
          quit_on_open = false,      -- 开文件后树不关，连续选文件
          resize_window = true,
          window_picker = { enable = false }, -- 多 window 时不弹选择器，直接在当前编辑区开
        },
      },
      update_focused_file = {
        enable = true,
        update_root = false,
      },
      -- 树内部快捷键（不污染全局）
      on_attach = function(bufnr)
        local api = require("nvim-tree.api")
        local map = vim.keymap.set
        local opts = { buffer = bufnr, silent = true, noremap = true }
        -- local function copy_abs_to_clip()
        --   local node = api.tree.get_node_under_cursor()
        --   if not node then return end
        --     local path = node.absolute_path
        --       -- 用 OSC 52 直接写系统剪贴板
        --     local b64 = vim.base64.encode(path)
        --     vim.api.nvim_chan_send(vim.v.stderr, "\x1b]52;c;" .. b64 .. "\x07")
        --     vim.notify("Copied: " .. path)
        -- end
        -- 文件操作
        map("n", "<CR>",  api.node.open.edit,               opts) -- 打开文件，焦点回编辑区
        map("n", "o",     api.node.open.edit,               opts)
        map("n", "<C-v>", api.node.open.vertical,           opts) -- 垂直分屏开
        map("n", "<C-x>", api.node.open.horizontal,         opts) -- 水平分屏开
        map("n", "<C-t>", api.node.open.tab,                opts) -- 新 tab 开

        -- 树导航
        map("n", "h",     api.node.navigate.parent_close,   opts) -- 收起目录
        map("n", "l",     api.node.open.edit,               opts) -- 展开/打开
        map("n", "J",     api.node.navigate.sibling.next,   opts)
        map("n", "K",     api.node.navigate.sibling.prev,   opts)

        -- 文件管理
        map("n", "a",     api.fs.create,                    opts) -- 新建文件/目录
        map("n", "d",     api.fs.remove,                    opts) -- 删除
        map("n", "r",     api.fs.rename,                    opts) -- 重命名
        map("n", "x",     api.fs.cut,                       opts) -- 剪切
        map("n", "p",     api.fs.paste,                     opts) -- 粘贴
        map("n", "y",     api.fs.copy.filename,             opts) -- 复制文件名
        map("n", "Y",     api.fs.copy.absolute_path,        opts) -- 复制相对路径

        -- 刷新
        map("n", "R",     api.tree.reload,                  opts)

        -- 退出树（回编辑区）
        map("n", "q",     "<C-w>l",                         opts)
        map("n", "<Esc>", "<C-w>l",                         opts)

        -- 帮助
        map("n", "?",     api.tree.toggle_help,             opts)
      end,
    })
  end,
}
