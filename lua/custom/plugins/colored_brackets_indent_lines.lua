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

      local highlight_dim = {
        'RainbowYellowDim',
        'RainbowVioletDim',
        'RainbowBlueDim',
      }

      local hooks = require 'ibl.hooks'

      -- Create the highlight groups using the current colourscheme colours
      hooks.register(hooks.type.HIGHLIGHT_SETUP, function()
        -- Bright for active scope
        vim.api.nvim_set_hl(0, 'RainbowYellow', { fg = '#FFCB8B' })
        vim.api.nvim_set_hl(0, 'RainbowViolet', { fg = '#C792EA' })
        vim.api.nvim_set_hl(0, 'RainbowBlue', { fg = '#82AAFF' })
        -- Dimmed for inactive indent lines
        vim.api.nvim_set_hl(0, 'RainbowYellowDim', { fg = '#6b5a3e' })
        vim.api.nvim_set_hl(0, 'RainbowVioletDim', { fg = '#4a3560' })
        vim.api.nvim_set_hl(0, 'RainbowBlueDim', { fg = '#2e4a6b' })
      end)

      vim.g.rainbow_delimiters = { highlight = highlight }

      require('ibl').setup {
        indent = {
          highlight = highlight_dim,
          char = '│', -- thin line character
        },
        scope = {
          enabled = false,
          -- highlight = highlight,
          -- show_start = false, -- removes the underline on scope start
          -- show_end = false, -- removes the underline on scope end
          -- -- include = {
          --   node_type = { ['*'] = { '*' } },
          --   -- node_type = {
          --   --   lua = { 'if_statement', 'for_statement', 'while_statement', 'function_definition', 'table_constructor' },
          --   -- python = { 'if_statement', 'for_statement', 'while_statement', 'function_definition', 'class_definition' },
          --   -- typescript = { 'if_statement', 'for_statement', 'while_statement', 'function_declaration', 'arrow_function', 'class_declaration' },
          --   -- },
          -- },
        },
      }

      hooks.register(hooks.type.SCOPE_HIGHLIGHT, hooks.builtin.scope_highlight_from_extmark)
    end,
  },
}
