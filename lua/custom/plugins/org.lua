return {
  {
    'nvim-orgmode/orgmode',
    event = 'VeryLazy',
    ft = { 'org' },
    config = function()
      -- Setup orgmode
      local org_path = os.getenv 'AB_ORG_DIR'
      require('orgmode').setup {
        org_agenda_files = org_path .. '**/*',
        org_default_notes_file = org_path .. 'refile.org',
        org_log_repeat = false,
        win_split_mode = { 'float', 0.9 },
      }

      -- NOTE: If you are using nvim-treesitter with ~ensure_installed = "all"~ option
      -- add ~org~ to ignore_install
      -- require('nvim-treesitter.configs').setup({
      --   ensure_installed = 'all',
      --   ignore_install = { 'org' },
      -- })
    end,
  },
  {
    'akinsho/org-bullets.nvim',
    config = function()
      require('org-bullets').setup()
    end,
  },
}
