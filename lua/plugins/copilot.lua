if true then return {} end -- WARN: remove this line to activate file
return {
  "github/copilot.vim",
  opts = function(_, config)
    config.sources = {
      require("copilot").sources,
    }
    return config
  end,
}
