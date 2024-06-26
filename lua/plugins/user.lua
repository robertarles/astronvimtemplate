-- if true then return {} end -- WARN: REMOVE THIS LINE TO ACTIVATE THIS FILE

-- You can also add or configure plugins by creating files in this `plugins/` folder
-- Here are some examples:

-- @type LazySpec
return {
  {
    "renerocksai/telekasten.nvim",
    dependencies = { "nvim-telescope/telescope.nvim" },
    ft = "markdown",
    config = function(plugin, opts)
      require("telekasten").setup {
        home = vim.fn.expand "~/plaintext.robert/notes", -- Put the name of your notes directory here
      }
    end,
  },
  {
    "hedyhli/markdown-toc.nvim",
    ft = "markdown", -- Lazy load on markdown filetype
    cmd = { "Mtoc" }, -- Or, lazy load on "Mtoc" command
    opts = {
      headings = {
        -- Include headings before the ToC (or current line for `:Mtoc insert`).
        -- Setting to true will include headings that are defined before the ToC
        -- position to be included in the ToC.
        before_toc = false,
      },

      -- Table or boolean. Set to true to use these defaults, set to false to disable completely.
      -- Fences are needed for the update/remove commands, otherwise you can
      -- manually select ToC and run update.
      fences = {
        enabled = true,
        -- These fence texts are wrapped within "<!-- % -->", where the '%' is
        -- substituted with the text.
        start_text = "mtoc-start",
        end_text = "mtoc-end",
        -- An empty line is inserted on top and below the ToC list before the being
        -- wrapped with the fence texts, same as vim-markdown-toc.
      },

      -- Enable auto-update of the ToC (if fences found) on buffer save
      auto_update = true,

      toc_list = {
        -- string or list of strings (for cycling)
        -- If cycle_markers = false and markers is a list, only the first is used.
        -- You can set to '1.' to use a automatically numbered list for ToC (if
        -- your markdown render supports it).
        markers = "*",
        cycle_markers = false,
        -- Example config for cycling markers:
        ----- markers = {'*', '+', '-'},
        ----- cycle_markers = true,
      },
    },
  },
  {
    "tadmccorkle/markdown.nvim",
    ft = "markdown", -- or 'event = "VeryLazy"'
    opts = {
      -- configuration here or empty for defaults
    },
  },
  -- == Examples of Adding Plugins ==

  -- "andweeb/presence.nvim",
  -- {
  --   "ray-x/lsp_signature.nvim",
  --   event = "BufRead",
  --   config = function() require("lsp_signature").setup() end,
  -- },

  -- == Examples of Overriding Plugins ==

  -- customize alpha options
  -- {
  --   "goolord/alpha-nvim",
  --   opts = function(_, opts)
  --     -- customize the dashboard header
  --     opts.section.header.val = {
  --       " █████  ███████ ████████ ██████   ██████",
  --       "██   ██ ██         ██    ██   ██ ██    ██",
  --       "███████ ███████    ██    ██████  ██    ██",
  --       "██   ██      ██    ██    ██   ██ ██    ██",
  --       "██   ██ ███████    ██    ██   ██  ██████",
  --       " ",
  --       "    ███    ██ ██    ██ ██ ███    ███",
  --       "    ████   ██ ██    ██ ██ ████  ████",
  --       "    ██ ██  ██ ██    ██ ██ ██ ████ ██",
  --       "    ██  ██ ██  ██  ██  ██ ██  ██  ██",
  --       "    ██   ████   ████   ██ ██      ██",
  --     }
  --     return opts
  --   end,
  -- },

  -- You can disable default plugins as follows:
  -- { "max397574/better-escape.nvim", enabled = false },

  -- You can also easily customize additional setup of plugins that is outside of the plugin's setup call
  -- {
  --   "L3MON4D3/LuaSnip",
  --   config = function(plugin, opts)
  --     require "astronvim.plugins.configs.luasnip"(plugin, opts) -- include the default astronvim config that calls the setup call
  --     -- add more custom luasnip configuration such as filetype extend or custom snippets
  --     local luasnip = require "luasnip"
  --     luasnip.filetype_extend("javascript", { "javascriptreact" })
  --   end,
  -- },

  -- {
  --   "windwp/nvim-autopairs",
  --   config = function(plugin, opts)
  --     require "astronvim.plugins.configs.nvim-autopairs"(plugin, opts) -- include the default astronvim config that calls the setup call
  --     -- add more custom autopairs configuration such as custom rules
  --     local npairs = require "nvim-autopairs"
  --     local Rule = require "nvim-autopairs.rule"
  --     local cond = require "nvim-autopairs.conds"
  --     npairs.add_rules(
  --       {
  --         Rule("$", "$", { "tex", "latex" })
  --           -- don't add a pair if the next character is %
  --           :with_pair(cond.not_after_regex "%%")
  --           -- don't add a pair if  the previous character is xxx
  --           :with_pair(
  --             cond.not_before_regex("xxx", 3)
  --           )
  --           -- don't move right when repeat character
  --           :with_move(cond.none())
  --           -- don't delete if the next character is xx
  --           :with_del(cond.not_after_regex "xx")
  --           -- disable adding a newline when you press <cr>
  --           :with_cr(cond.none()),
  --       },
  --       -- disable for .vim files, but it work for another filetypes
  --       Rule("a", "a", "-vim")
  --     )
  --   end,
  -- },
}
