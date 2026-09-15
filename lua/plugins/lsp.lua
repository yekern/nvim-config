return {
  -- ── Mason（LSP / 格式化器安装器）─────────────────
  {
    "mason-org/mason.nvim",
    opts = {},
  },

  -- ── Mason-LSPConfig ─────────────────────────────
  {
    "mason-org/mason-lspconfig.nvim",
    opts = {
      ensure_installed = { "lua_ls", "phpactor", "ts_ls", "vue_ls" },
      automatic_enable = false,
    },
    dependencies = { "mason-org/mason.nvim" },
  },

  -- ── LSP 配置（0.11+ 原生 API）───────────────────
  {
    "neovim/nvim-lspconfig",
    dependencies = { "mason-org/mason-lspconfig.nvim" },
    config = function()
      -- 快捷键挂在 LspAttach 上：只有 LSP 生效的 buffer 才有这些键
      vim.api.nvim_create_autocmd("LspAttach", {
        group = vim.api.nvim_create_augroup("UserLspKeymaps", { clear = true }),
        callback = function(args)
          local map = function(lhs, rhs, desc)
            vim.keymap.set("n", lhs, rhs, { buffer = args.buf, silent = true, desc = desc })
          end

          map("<leader>ld", vim.lsp.buf.definition, "跳到定义")
          map("<leader>lr", vim.lsp.buf.references, "查找引用")
          map("<leader>li", vim.lsp.buf.implementation, "跳到实现")
          map("<leader>lh", vim.lsp.buf.hover, "悬浮文档")
          map("<leader>ln", vim.lsp.buf.rename, "重命名符号")
          map("<leader>la", vim.lsp.buf.code_action, "代码动作 / 快速修复")
          map("<leader>lf", function()
            vim.lsp.buf.format({ async = true })
          end, "格式化当前文件")
          map("<leader>lj", vim.diagnostic.goto_next, "下一个诊断")
          map("<leader>lk", vim.diagnostic.goto_prev, "上一个诊断")
          map("K", vim.lsp.buf.hover, "悬浮文档")
        end,
      })

      vim.diagnostic.config({
        virtual_text = true,
        signs = true,
        underline = true,
        update_in_insert = false,
      })

      -- PHP：Phpactor
      vim.lsp.config("phpactor", {
        cmd = { "phpactor", "language-server" },
        filetypes = { "php" },
        root_markers = { "composer.json", ".git" },
      })
      vim.lsp.enable("phpactor")

      -- Lua：Neovim 配置自身
      vim.lsp.config("lua_ls", {
        settings = {
          Lua = {
            runtime = { version = "LuaJIT" },
            workspace = {
              library = vim.api.nvim_get_runtime_file("", true),
              checkThirdParty = false,
            },
            diagnostics = { globals = { "vim" } },
            telemetry = { enable = false },
          },
        },
      })
      vim.lsp.enable("lua_ls")
    end,
  },
}
