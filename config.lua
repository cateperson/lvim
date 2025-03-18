
lvim.plugins = {
  { "catppuccin/nvim", name = "catppuccin" },
  {
    'IogaMaster/neocord',
    event = "VeryLazy"
  },
  {
      "nvim-neorg/neorg",
      lazy = false,
      version = "*",
      config = function()
        require("neorg").setup {
          load = {
            ["core.defaults"] = {},
            ["core.concealer"] = {},
            ["core.dirman"] = {
              config = {
                workspaces = {
                  notes = "~/notes",
                },
                default_workspace = "notes",
              },
            },
          },
        }

        vim.wo.foldlevel = 99
        vim.wo.conceallevel = 2
      end,
    },
  -- Rust development plugins
  { "neovim/nvim-lspconfig" },
  { "hrsh7th/nvim-cmp", dependencies = { "hrsh7th/cmp-nvim-lsp", "hrsh7th/cmp-buffer", "hrsh7th/cmp-path" } },
  { "simrat39/rust-tools.nvim" },
  { "Saecki/crates.nvim", dependencies = { "nvim-lua/plenary.nvim" } },
  { "mfussenegger/nvim-dap" },
  { "rcarriga/nvim-dap-ui" },
  { "theHamsta/nvim-dap-virtual-text" },
  { "nvim-treesitter/nvim-treesitter", build = ":TSUpdate" },
  { "nvim-telescope/telescope.nvim", dependencies = { "nvim-lua/plenary.nvim" } },
  { "jose-elias-alvarez/null-ls.nvim" },
  { "folke/trouble.nvim" },
  { "stevearc/conform.nvim" },
  { "j-hui/fidget.nvim",
    opts = {
      
    },
  },
}

lvim.colorscheme = "catppuccin-mocha"
lvim.format_on_save.enabled = true
lvim.format_on_save.pattern = { "*.rs" }

-- Setup crates.nvim
require("crates").setup()

require("lvim.lsp.manager").setup("rust_analyzer")
require("rust-tools").setup({})
-- Rust keybindings under <leader>R
lvim.builtin.which_key.mappings["R"] = {
  name = "Rust",  -- Group name in the cheatsheet
  u = { "<cmd>lua require('crates').upgrade_crate()<CR>", "Upgrade Crate" },
  U = { "<cmd>lua require('crates').upgrade_all_crates()<CR>", "Upgrade All Crates" },
  i = { "<cmd>lua require('crates').show_popup()<CR>", "Show Crate Info" },
  v = { "<cmd>lua require('crates').show_versions_popup()<CR>", "Show Versions" },
  f = { "<cmd>lua require('crates').show_features_popup()<CR>", "Show Features" },
  d = { "<cmd>lua require('crates').show_dependencies_popup()<CR>", "Show Dependencies" },
}

-- The setup config table shows all available config options with their default values:
require("neocord").setup({
  logo                = "auto",
  logo_tooltip        = nil,
  main_image          = "language",
  log_level           = nil,
  debounce_timeout    = 10,
  blacklist           = {},
  file_assets         = {},
  show_time           = true,
  global_timer        = false,
  editing_text        = "Editing %s",
  file_explorer_text  = "Browsing %s",
  git_commit_text     = "Committing changes",
  plugin_manager_text = "Managing plugins",
  reading_text        = "Reading %s",
  workspace_text      = "Working on %s",
  line_number_text    = "Line %s out of %s",
  terminal_text       = "Using Terminal",
})

