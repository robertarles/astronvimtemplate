return {
  {
    "zbirenbaum/copilot.lua",
    cmd = "Copilot",
    event = "InsertEnter",
    config = function()
      require("copilot").setup {
        -- both false to get suggestions in the menu
        suggestion = { enabled = false },
        panel = { enabled = false },
      }
    end,
  },
  { "zbirenbaum/copilot-cmp", config = function() require("copilot_cmp").setup() end },
}
