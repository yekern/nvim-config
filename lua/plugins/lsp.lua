return {
  -- ── Mason（LSP 安装器）──────────────────────────
  {
    "mason-org/mason.nvim",
    opts = {},
  },

  -- ── Mason-LSPConfig ─────────────────────────────
  {
    "mason-org/mason-lspconfig.nvim",
    opts = {
      -- 按项目技术栈需要的语言服务（gopls 用 ~/go/bin 里那份，不重复装）
      ensure_installed = { "lua_ls", "phpactor", "laravel-ls", "vtsls", "vue_ls" },
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
          map("<leader>lj", vim.diagnostic.goto_next, "下一个诊断")
          map("<leader>lk", vim.diagnostic.goto_prev, "上一个诊断")
          map("K", vim.lsp.buf.hover, "悬浮文档")
          -- 格式化 <leader>lf 在 conform.nvim 里（见 lua/plugins/format.lua）
        end,
      })

      vim.diagnostic.config({
        virtual_text = true,
        signs = true,
        underline = true,
        update_in_insert = false,
      })

      -- ── PHP：Phpactor ───────────────────────────
      vim.lsp.config("phpactor", {
        cmd = { "phpactor", "language-server" },
        filetypes = { "php" },
        root_markers = { "composer.json", ".git" },
      })
      vim.lsp.enable("phpactor")

      -- ── Laravel：laravel-ls（route / config / view / env / 模型字段补全）──
      -- 与 phpactor 并存：phpactor 管通用 PHP，laravel-ls 管 Laravel 语法糖
      vim.lsp.config("laravel_ls", {
        filetypes = { "php", "blade" },
      })
      vim.lsp.enable("laravel_ls")

      -- ── Lua：Neovim 配置自身 ────────────────────
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

      -- ── Go：gopls（go.mod / go.work 项目）────────
      vim.lsp.config("gopls", {
        settings = {
          gopls = {
            staticcheck = true, -- 需要 staticcheck 命令（~/go/bin/staticcheck 已装）
            usePlaceholders = true,
            analyses = { unusedparams = true },
            hints = {
              parameterNames = true,
              assignVariableTypes = true,
              compositeLiteralFields = true,
            },
          },
        },
      })
      vim.lsp.enable("gopls")

      -- ── TS / JS / Vue ───────────────────────────
      -- vue_ls 3.x 是 hybrid 模式：Vue 的 TS 部分必须由 vtsls 承担，
      -- 所以两个一起开，并给 vtsls 挂上 @vue/typescript-plugin。
      local vue_language_server = vim.fn.stdpath("data")
        .. "/mason/packages/vue-language-server/node_modules/@vue/language-server"

      vim.lsp.config("vtsls", {
        filetypes = { "javascript", "javascriptreact", "typescript", "typescriptreact", "vue" },
        settings = {
          vtsls = {
            autoUseWorkspaceTsdk = true,
            tsserver = {
              globalPlugins = {
                {
                  name = "@vue/typescript-plugin",
                  location = vue_language_server,
                  languages = { "vue" },
                  configNamespace = "typescript",
                },
              },
            },
          },
        },
      })
      vim.lsp.enable("vtsls")
      vim.lsp.enable("vue_ls")
    end,
  },
}
