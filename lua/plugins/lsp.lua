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
      -- 注意：这里必须是 lspconfig 的 server 名，不是 mason 包名
      -- （laravel-ls 的包名有连字符，server 名是下划线 laravel_ls，写错会在启动时弹 warning）
      -- , "vtsls", "vue_ls"
      ensure_installed = { "lua_ls", "intelephense", "phpactor", "laravel_ls" },
      automatic_enable = false,
    },
    dependencies = { "mason-org/mason.nvim" },
  },

  -- ── LSP 配置（0.11+ 原生 API）───────────────────
  {
    "neovim/nvim-lspconfig",
    dependencies = { "mason-org/mason-lspconfig.nvim" },
    config = function()
      -- <leader>l* 与 K 的键位在 core/keymaps.lua 里**全局**定义。
      -- 曾经挂在 LspAttach 上（buffer 局部），结果是没附加 LSP 的文件里按 <leader>ld 会漏成
      -- 「空格 + l + d」原生命令，把当前行删掉；不要再改回 buffer 局部。
      vim.diagnostic.config({
        virtual_text = true,
        signs = true,
        underline = true,
        update_in_insert = false,
      })

      -- ── PHP：Intelephense（主力：补全/hover/跳转/引用/诊断）──
      -- 免费版就够用：功能比 phpactor 准且快（Laravel 继承链、门面解析都更完整）
      -- rename / code action / 找实现 是付费功能（$35 一次性），在免费版下静默返回空
      vim.lsp.config("intelephense", {
        -- 钉死用 mason 那份（你 nvm/volta 全局也装了一个同名命令，避免版本漂移）
        cmd = { vim.fn.stdpath("data") .. "/mason/bin/intelephense", "--stdio" },
        settings = {
          intelephense = {
            environment = { phpVersion = "8.2" },
            files = { maxSize = 5000000 },
            format = { enable = false }, -- 格式化交给 Pint
            telemetry = { enabled = false },
            -- licenceKey = "如果你买了授权，填这里",
          },
        },
        on_init = function(client)
          -- 付费能力在免费版返回空，交给 phpactor 接（买了授权就把这三行删掉）
          client.server_capabilities.renameProvider = nil
          client.server_capabilities.codeActionProvider = nil
          client.server_capabilities.implementationProvider = nil
        end,
      })
      vim.lsp.enable("intelephense")

      -- ── PHP：Phpactor（只当"重构引擎"）──────────
      -- 免费白送 rename / 代码动作 / 找实现；读取类能力全部关掉，避免和 intelephense 重复
      vim.lsp.config("phpactor", {
        cmd = { "phpactor", "language-server" },
        filetypes = { "php" },
        root_markers = { "composer.json", ".git" },
        on_init = function(client)
          local caps = client.server_capabilities
          caps.completionProvider = nil
          caps.hoverProvider = nil
          caps.definitionProvider = nil
          caps.declarationProvider = nil
          caps.typeDefinitionProvider = nil
          caps.referencesProvider = nil
          caps.documentSymbolProvider = nil
          caps.signatureHelpProvider = nil
          caps.diagnosticProvider = nil
          caps.documentFormattingProvider = nil
        end,
      })
      vim.lsp.enable("phpactor")

      -- ── Laravel：laravel-ls（框架专属）──────────
      -- 实测：config('app.url') 能跳到 config/app.php，route()/view()/__() 同理；
      -- 通用 PHP 能力它没有，所以三个服务互补，不冲突
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
      -- local vue_language_server = vim.fn.stdpath("data")
      --   .. "/mason/packages/vue-language-server/node_modules/@vue/language-server"

      -- vim.lsp.config("vtsls", {
      --   filetypes = { "javascript", "javascriptreact", "typescript", "typescriptreact", "vue" },
      --   settings = {
      --     vtsls = {
      --       autoUseWorkspaceTsdk = true,
      --       tsserver = {
      --         globalPlugins = {
      --           {
      --             name = "@vue/typescript-plugin",
      --             location = vue_language_server,
      --             languages = { "vue" },
      --             configNamespace = "typescript",
      --           },
      --         },
      --       },
      --     },
      --   },
      -- })
      -- vim.lsp.enable("vtsls")
      -- vim.lsp.enable("vue_ls")
    end,
  },
}
