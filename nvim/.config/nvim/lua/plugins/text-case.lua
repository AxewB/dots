vim.pack.add({
  { src = 'https://github.com/johmsalas/text-case.nvim' },
})

require('textcase').setup({})


local tc = require('textcase')

vim.api.nvim_create_user_command('TCupper',  function() tc.current_word('to_upper_case')    end, { desc = 'Upper    case current word' })
vim.api.nvim_create_user_command('TClower',  function() tc.current_word('to_lower_case')    end, { desc = 'Lower    case current word' })
vim.api.nvim_create_user_command('TCsnake',  function() tc.current_word('to_snake_case')    end, { desc = 'Snake    case current word' })
vim.api.nvim_create_user_command('TCdash',   function() tc.current_word('to_dash_case')     end, { desc = 'Dash     case current word' })
vim.api.nvim_create_user_command('TCconst',  function() tc.current_word('to_constant_case') end, { desc = 'Constant case current word' })
vim.api.nvim_create_user_command('TCdot',    function() tc.current_word('to_dot_case')      end, { desc = 'Dot      case current word' })
vim.api.nvim_create_user_command('TCcomma',  function() tc.current_word('to_comma_case')    end, { desc = 'Comma    case current word' })
vim.api.nvim_create_user_command('TCphrase', function() tc.current_word('to_phrase_case')   end, { desc = 'Phrase   case current word' })
vim.api.nvim_create_user_command('TCcamel',  function() tc.current_word('to_camel_case')    end, { desc = 'Camel    case current word' })
vim.api.nvim_create_user_command('TCpasc',   function() tc.current_word('to_pascal_case')   end, { desc = 'Pascal   case current word' })
vim.api.nvim_create_user_command('TCtitle',  function() tc.current_word('to_title_case')    end, { desc = 'Title    case current word' })
vim.api.nvim_create_user_command('TCpath',   function() tc.current_word('to_path_case')     end, { desc = 'Path     case current word' })
