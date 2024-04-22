return { -- override nvim-cmp plugin
  "hrsh7th/nvim-cmp",
  -- override the options table that is used in the `require("cmp").setup()` call
  opts = function(_, opts)
    -- opts parameter is the default options table
    -- the function is lazy loaded so cmp is able to be required
    local cmp = require "cmp"
    -- the next two opts are likely hallucinations of copilot
    -- opts.snippet = cmp.config.snippet({ {
    --   expand = function(args) vim.fn["vsnip#anonymous"](args.body) end,
    -- },
    -- opts.mapping = cmp.config.mapping({
    --   ["<C-d>"] = cmp.mapping.scroll_docs(-4),
    --   ["<C-f>"] = cmp.mapping.scroll_docs(4),
    --   ["<C-Space>"] = cmp.mapping.complete(),
    --   ["<C-e>"] = cmp.mapping.close(),
    --   ["<CR>"] = cmp.mapping.confirm {
    --     behavior = cmp.ConfirmBehavior.Insert,
    --     select = true,
    --   },
    -- },
    opts.sources = cmp.config.sources {
      { name = "copilot" },
      -- the following are likely halluciations of copilot
      -- { name = "nvim_tsc" },
      -- { name = "nvim_typescript" },
      -- { name = "nvim_javascript" },
      -- { name = "nvim_json" },
      -- { name = "nvim_css" },
      -- { name = "nvim_html" },
      -- { name = "nvim_tsx" },
      -- { name = "nvim_jsx" },
      -- { name = "nvim_angular" },
      -- { name = "nvim_vue" },
      -- { name = "nvim_svelte" },
      -- { name = "nvim_react" },
      -- { name = "nvim_react_native" },
      -- { name = "nvim_react_ts" },
      -- { name = "nvim_react_js" },
      -- { name = "nvim_react_jsx" },
      -- { name = "nvim_react_tsx" },
      -- { name = "nvim_react_native" },
      -- { name = "nvim_react_native_ts" },
      -- { name = "nvim_react_native_js" },
      -- { name = "nvim_react_native_jsx" },
      -- { name = "nvim_react_native_tsx" },
      -- { name = "nvim_go" },
      -- { name = "nvim_rust" },
      -- { name = "nvim_python" },
      -- { name = "nvim_cpp" },
      -- { name = "nvim_c" },
      { name = "nvim_lua" },
      { name = "luasnip" },
      { name = "nvim_lsp" },
      { name = "vsnip" },
      { name = "buffer" },
      { name = "path" },
      { name = "treesitter" },
    }
  end,
}
