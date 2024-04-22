-- if true then return {} end -- WARN: REMOVE THIS LINE TO ACTIVATE THIS FILE

-- AstroCommunity: import any community modules here
-- We import this file in `lazy_setup.lua` before the `plugins/` folder.
-- This guarantees that the specs are processed before any user plugins.

---@type LazySpec
return {
  "AstroNvim/astrocommunity",
  { import = "astrocommunity.pack.lua" },
  "todo-comments-nvim",
  { import = "astrocommunity.editing-support.todo-comments-nvim" },
  "git-blame-nvim",
  { import = "astrocommunity.git.git-blame-nvim" },
  "octo-nvim",
  { import = "astrocommunity.git.octo-nvim" },
  "markdown-preview-nvim",
  { import = "astrocommunity.markdown-and-latex.markdown-preview-nvim" },
  "bash",
  { import = "astrocommunity.pack.bash" },
  "docker",
  { import = "astrocommunity.pack.docker" },
  "go",
  { import = "astrocommunity.pack.go" },
  "java",
  { import = "astrocommunity.pack.java" },
  "json",
  { import = "astrocommunity.pack.json" },
  "lua",
  { import = "astrocommunity.pack.lua" },
  "python",
  { import = "astrocommunity.pack.python" },
  "rust",
  { import = "astrocommunity.pack.rust" },
  "markdown",
  { import = "astrocommunity.pack.markdown" },
  "yaml",
  { import = "astrocommunity.pack.yaml" },
  "sql",
  { import = "astrocommunity.pack.sql" },
  "neovide",
  { import = "astrocommunity.recipes.neovide" },
  "vscode-icons",
  { import = "astrocommunity.recipes.vscode-icons" },
  "vscode",
  { import = "astrocommunity.recipes.vscode" },
  "nvim-snippets",
  { import = "astrocommunity.snippet.nvim-snippets" },
}
