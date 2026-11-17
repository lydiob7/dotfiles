-- You can add your own plugins here or in other files in this directory!
--  I promise not to create any merge conflicts in this directory :)
--
-- See the kickstart.nvim README for more information
return {
  {
    'antosha417/nvim-lsp-file-operations',
    dependencies = {
      'nvim-lua/plenary.nvim',
      'nvim-neo-tree/neo-tree.nvim',
    },
    config = function()
      require('lsp-file-operations').setup()
    end,
  },

  {
    'windwp/nvim-ts-autotag',
    ft = {
      'javascript',
      'javascriptreact',
      'typescript',
      'typescriptreact',
      'html',
    },
    config = function()
      require('nvim-ts-autotag').setup()
    end,
  },

  {
    'karb94/neoscroll.nvim',
    event = 'VeryLazy',
    opts = {
      mappings = { '<C-u>', '<C-d>', '<C-f>', '<C-y>', '<C-e>', 'zt', 'zz', 'zb' },
      hide_cursor = false,
      stop_eof = true,
      respect_scrolloff = true,
      cursor_scrolls_alone = true,
      easing = 'quadratic', -- "linear","cubic","quartic","quintic","circular"
      duration = 100, -- ms per 100 lines; lower = faster
    },
  },
}
