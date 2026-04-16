-- Add indentation guides even on blank lines with color matching brackets

---@module 'lazy'
---@type LazySpec
return {
  {
    'HiPhish/rainbow-delimiters.nvim',
  },
  {
    'lukas-reineke/indent-blankline.nvim',
    main = 'ibl',
    ---@module 'ibl'
    ---@type ibl.config
    config = function()
      local highlight = {
        'RainbowYellow',
        'RainbowViolet',
        'RainbowBlue',
      }

      local hooks = require 'ibl.hooks'

      -- Create the highlight groups using the current colourscheme colours
      hooks.register(hooks.type.HIGHLIGHT_SETUP, function()
        vim.api.nvim_set_hl(0, 'RainbowYellow', { fg = '#FFCB8B' })
        vim.api.nvim_set_hl(0, 'RainbowViolet', { fg = '#C792EA' })
        vim.api.nvim_set_hl(0, 'RainbowBlue', { fg = '#82AAFF' })
      end)

      vim.g.rainbow_delimiters = { highlight = highlight }

      require('ibl').setup {
        indent = {
          highlight = highlight,
          char = '│', -- thin line character
        },
        scope = {
          highlight = highlight,
          show_start = false, -- removes the underline on scope start
          show_end = false, -- removes the underline on scope end
        },
      }

      hooks.register(hooks.type.SCOPE_HIGHLIGHT, hooks.builtin.scope_highlight_from_extmark)
    end,
  },
}
