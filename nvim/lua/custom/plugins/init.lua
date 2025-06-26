-- You can add your own plugins here or in other files in this directory!
--  I promise not to create any merge conflicts in this directory :)
--
-- See the kickstart.nvim README for more information
return {
  {
    'nvim-tree/nvim-tree.lua',
    version = '*',
    dependencies = {
      'nvim-tree/nvim-web-devicons', -- optional, for file icons
    },
    config = function()
      require('nvim-tree').setup {
        view = {
          width = 30,
          side = 'left',
        },
        actions = {
          open_file = {
            quit_on_open = false,
          },
        },
      }

      -- optional: auto-open tree when starting Neovim
      vim.api.nvim_create_autocmd({ 'VimEnter' }, {
        callback = function()
          require('nvim-tree.api').tree.open()
        end,
      })
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
}
