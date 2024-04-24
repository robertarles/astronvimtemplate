return {
  "hrsh7th/nvim-cmp",
  opts = function(_, opts)
    local cmp = require "cmp"
    opts.sources = cmp.config.sources {
      { name = "nvim_lsp", group_index = 2 },
      { name = "luasnip", group_index = 2 },
      { name = "buffer", group_index = 2 },
      { name = "path", group_index = 2 },
      { name = "copilot", group_index = 2 },
    }
    local lspkind = require "lspkind"
    opts.formatting = {
      format = function(entry, vim_item)
        vim_item.kind = lspkind.presets.default[vim_item.kind]
        vim_item.menu = ({
          buffer = "[Buffer]",
          nvim_lsp = "[LSP]",
          luasnip = "[Snippet]",
          copilot = "[Copilot]",
          path = "[Path]",
        })[entry.source.name]
        return vim_item
      end,
    }
    --   opts.snippet = {
    --     expand = function(args) require("luasnip").lsp_expand(args.body) end,
    --   }
  end,
}
