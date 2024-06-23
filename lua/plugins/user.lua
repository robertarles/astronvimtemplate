-- if true then return {} end -- WARN: REMOVE THIS LINE TO ACTIVATE THIS FILE

-- You can also add or configure plugins by creating files in this `plugins/` folder
-- Here are some examples:

-- @type LazySpec
return {
  {
    "robertarles/taskra.nvim",
    ft = "markdown",
    lazy = true,

    -- dir = "user.plugins.taskra", -- This points to the file we created
    config = function()
      local taskra = require "taskra"
      vim.api.nvim_set_hl(0, "TaskraRed", { fg = "#FF4060" })
      vim.api.nvim_set_hl(0, "TaskraRed", { fg = "#FF4000" })
      vim.api.nvim_set_hl(0, "TaskraYellow", { fg = "#C7F000" })
      vim.api.nvim_set_hl(0, "TaskraGreen", { fg = "#008B00" })
      vim.api.nvim_set_hl(0, "TaskraBlue", { fg = "#00008B" })
      -- Error: Usually red, for errors
      -- Warning: Often yellow or orange, for warnings
      -- Info: Typically blue, for informational highlights
      -- Hint: Often cyan or light blue, for hints
      -- Todo: Usually stands out (like bright yellow), for TODO comments
      -- Search: For search matches
      -- IncSearch: For the current search match
      -- Visual: For visually selected text
      -- Comment: For comments in code
      -- String: For string literals in code
      -- Number: For numeric literals
      -- Function: For function names
      -- Keyword: For language keywords
      -- Constant: For constant values
      -- Add syntax highlighting rules
      --taskra.add_syntax_rule("TODO", "Todo")
      --taskra.add_syntax_rule("FIXME", "Error")
      --taskra.add_syntax_rule("NOTE", "Comment")
      taskra.add_syntax_rule("- %[.%] [ .]*([aA])%d ", "TaskraRed")
      taskra.add_syntax_rule("- %[.%] [ .]*([bB])%d ", "TaskraYellow")
      taskra.add_syntax_rule("- %[.%] [ .]*([cCdDeEfF])%d ", "TaskraGreen")
      taskra.add_syntax_rule("- %[([^xX])%] ", "Warning")
      taskra.add_syntax_rule("- %[([xX])%] ", "Error")
      -- Add text manipulation functions
      taskra.add_text_function("upper", function()
        local line = vim.api.nvim_get_current_line()
        vim.api.nvim_set_current_line(line:upper())
      end)

      -- create a vim command
      vim.api.nvim_create_user_command("ReloadTaskra", function()
        package.loaded["taskra"] = nil
        require("taskra").setup()
        vim.cmd "bufdo e"
      end, {})

      -- Setup the plugin
      taskra.setup()
    end,
  },
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
