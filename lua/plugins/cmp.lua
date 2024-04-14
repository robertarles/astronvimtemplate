return {
  "hrsh7th/nvim-cmp",
  opts = function(_, opts)
    local cmp = require "cmp"
    opts.sources = cmp.config.sources {
      { name = "copilot", priority = 1500, group_index = 2 },
      { name = "nvim_lsp", priority = 1000, group_index = 2 },
      { name = "luasnip", priority = 750, group_index = 2 },
      { name = "buffer", priority = 500, group_index = 2 },
      { name = "path", priority = 250, group_index = 2 },
    }
  end,
}
