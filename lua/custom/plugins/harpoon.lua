-- Harpoon
-- https://github.com/ThePrimeagen/harpoon
return {
  'ThePrimeagen/harpoon',
  branch = 'harpoon2',
  config = function()
    local harpoon = require 'harpoon'
    harpoon:setup()

    vim.keymap.set('n', '<leader>aa', function()
      harpoon:list():add()
    end, { desc = 'Harpoon [A]ppend' })

    vim.keymap.set('n', '<leader>p', function()
      harpoon.ui:toggle_quick_menu(harpoon:list())
    end, { desc = 'Har[p]oon' })

    vim.keymap.set('n', ']a', function()
      harpoon:list():next()
    end, { desc = 'Harpoon Next File' })

    vim.keymap.set('n', '[a', function()
      harpoon:list():prev()
    end, { desc = 'Harpoon Prev File' })

    -- Set <space>1..<space>5 be my shortcuts to moving to the files
    for _, idx in ipairs { 1, 2, 3, 4, 5 } do
      vim.keymap.set('n', string.format('<space>%d', idx), function()
        harpoon:list():select(idx)
      end)
    end
  end,
}
