-- You can add your own plugins here or in other files in this directory!
--  I promise not to create any merge conflicts in this directory :)
--
-- See the kickstart.nvim README for more information
return {
  {
    'nvim-neo-tree/neo-tree.nvim',
    branch = 'v3.x',
    dependencies = {
      'nvim-lua/plenary.nvim',
      'nvim-tree/nvim-web-devicons', -- optional, but recommended
      'MunifTanjim/nui.nvim',
    },
    opts = {
      close_if_last_window = true,
      popup_border_style = 'rounded',
      enable_git_status = true,
      default_component_configs = {
        icon = {
          folder_closed = '',
          folder_open = '',
          folder_empty = '',
          default = '',
          highlight = 'NeoTreeFileIcon',
        },
        git_status = {
          symbols = {
            added = '✚',
            modified = '',
            deleted = '✖',
            renamed = '󰁕',
            untracked = '',
            ignored = '',
            unstaged = '󰄱',
            staged = '',
            conflict = '',
          },
        },
      },
      filesystem = {
        follow_current_file = true,
        filtered_items = {
          visible = false,
          hide_dotfiles = true,
          hide_gitignored = true,
        },
      },
      window = {
        position = 'left',
        width = 30,
        mappings = {
          ['<C-b>'] = 'close_window',
        },
      },
    },

    config = function(_, opts)
      require('neo-tree').setup(opts)

      vim.keymap.set('n', '<C-b>', '<Cmd>Neotree toggle filesystem<CR>', {
        desc = 'Toggle Neo-tree',
        noremap = true,
        silent = true,
      })

      vim.api.nvim_create_autocmd('User', {
        pattern = 'NeotreeBufferEnter',
        callback = function()
          -- delay to let Neo-tree finish setup
          vim.defer_fn(function()
            for _, buf in ipairs(vim.api.nvim_list_bufs()) do
              local name = vim.api.nvim_buf_get_name(buf)
              local modifiable = vim.bo[buf].modifiable
              local listed = vim.bo[buf].buflisted
              local filetype = vim.bo[buf].filetype

              if name == '' and modifiable and listed and filetype == '' then
                vim.api.nvim_buf_delete(buf, { force = true })
              end
            end
          end, 100) -- small delay in ms
        end,
      })
    end,
  },

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
}
