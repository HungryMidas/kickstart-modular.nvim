return {
  'lewis6991/hover.nvim',
  config = function()
    require('hover').setup {
      init = function()
        require 'hover.providers.lsp'
        require 'hover.providers.dap'
        require 'hover.providers.gh'
      end,
      preview_opts = {
        border = 'single',
      },
    }
    local hover = require 'hover'
    local enabled = false
    local augroup = vim.api.nvim_create_augroup('AutoHover', {})
    -- State management
    vim.keymap.set('n', '<leader>ht', function()
      enabled = not enabled

      if enabled then
        -- Enable auto-hover
        vim.api.nvim_create_autocmd({ 'CursorHold', 'CursorHoldI' }, {
          group = augroup,
          pattern = '*',
          callback = function()
            hover.hover()
          end,
        })
        vim.notify('Auto-hover ENABLED', vim.log.levels.INFO, { title = 'hover.nvim' })
      else
        -- Disable auto-hover
        vim.api.nvim_clear_autocmds { group = augroup }
        vim.notify('Auto-hover DISABLED', vim.log.levels.INFO, { title = 'hover.nvim' })
      end
    end, { desc = 'Toggle auto hover' })

    vim.keymap.set('n', '<C-p>', function()
      require('hover').hover_switch 'previous'
    end, { desc = 'hover.nvim (previous source)' })
    vim.keymap.set('n', '<C-n>', function()
      require('hover').hover_switch 'next'
    end, { desc = 'hover.nvim (next source)' })
  end,
}
