require("plugins.langmapper") -- required to be on top

-- nvim base config
require("base.settings")
require("base.bindings")
require("base.lsp")
require("base.commands")

-- base16 theme
require("theme")

-- language specific
require("base.language-specific.gdscript")


require("plugins.repeat")
-- plugins
require("plugins.suda")
require("plugins.snacks")
require("plugins.fzf")
require("plugins.treesitter")
require("plugins.treesitter-context")
require("plugins.blink-cmp")
require("plugins.conform")
require("plugins.lazydev")
require("plugins.live-rename")
require("plugins.mason")
require("plugins.mini-ai")
require("plugins.mini-align")
require("plugins.oil")
require("plugins.nvim-autopairs")
require("plugins.nvim-ts-autotag")
require("plugins.fidget")
require("plugins.nvim-highlight-colors")
require("plugins.todo-comments")
require("plugins.render-markdown")
require("plugins.tiny-inlinde-diagnostics")
require("plugins.gitsigns")
require("plugins.barbar")
require("plugins.differ")
require("plugins.lualine")
require("plugins.markdown-plus")
require("plugins.nvim-surround")
require("plugins.img-clip")
require("plugins.tmux")
require("plugins.multicursor")

require("plugins.language-specific.godot")
-- require("plugins.language-specific.d2")

require("plugins.sqlua")

-- fun plugins
-- require('plugins.fun.player-one')
require("plugins.fun.tiny-glimmer")

-- my plugins
require("plugins.edit_config")
require("plugins.move_with_fzf")


local lm = require("langmapper")
lm.automapping({ global = true, buffer = true })
lm.hack_get_keymap()
