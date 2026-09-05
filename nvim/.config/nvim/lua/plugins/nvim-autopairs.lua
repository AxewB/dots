vim.pack.add({
  { src = 'https://github.com/windwp/nvim-autopairs' },
})

local Rule = require('nvim-autopairs.rule')
local cond = require('nvim-autopairs.conds')
local npairs = require('nvim-autopairs')
local ts_conds = require('nvim-autopairs.ts-conds')

npairs.setup({
  enable_check_bracket_line = false,
})

npairs.add_rule(Rule('<', '>', {
  -- if you use nvim-ts-autotag, you may want to exclude these filetypes from this rule
  -- so that it doesn't conflict with nvim-ts-autotag
  '-html',
  '-javascriptreact',
  '-typescriptreact',
}):with_pair(
  -- regex will make it so that it will auto-pair on
  -- `a<` but not `a <`
  -- The `:?:?` part makes it also
  -- work on Rust generics like `some_func::<T>()`
  cond.before_regex('%a+:?:?$', 3)
):with_move(function(opts)
  return opts.char == '>'
end))

npairs.add_rules({
  Rule('{', '},', 'lua'):with_pair(
    ts_conds.is_ts_node({ 'table_constructor' })
  ),
  Rule("'", "',", 'lua'):with_pair(
    ts_conds.is_ts_node({ 'table_constructor' })
  ),
  Rule('"', '",', 'lua'):with_pair(
    ts_conds.is_ts_node({ 'table_constructor' })
  ),
})
