require("plugins.langmapper") -- required to be on top
-- nvim base config
require("base.settings")
require("base.bindings")
require("base.lsp")
require("base.commands")

-- language specific
require("base.language-specific.gdscript")

-- if using Neovide
require("clients.neovide")

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
require("plugins.mini-comment")
require("plugins.mini-ai")
require("plugins.mini-align")
require("plugins.mini-pairs")
require("plugins.mini-bracketed")
require("plugins.mini-move")
require("plugins.oil")
require("plugins.sibling-swap")
-- require("plugins.nvim-autopairs") -- idk why but it started putting cursor after closing part
require("plugins.nvim-ts-autotag")
require("plugins.fidget")
require("plugins.nvim-highlight-colors")
-- require("plugins.git-blame")
require("plugins.todo-comments")
require("plugins.text-case")
require("plugins.render-markdown")
require("plugins.tiny-inlinde-diagnostics")

-- optional plugins
require("plugins.lualine")
require("plugins.multicursor")
require("plugins.markdown-plus")
require("plugins.nvim-surround")
require("plugins.img-clip")
require("plugins.repeat")
require("plugins.tmux")
-- require("plugins.scratch")

-- require("plugins.stay-centered")

require("plugins.language-specific.godot")
-- require("plugins.language-specific.openscad")
-- require("plugins.language-specific.d2")

require("plugins.sqlua")

-- fun plugins
-- require('plugins.fun.player-one')
require("plugins.fun.tiny-glimmer")

-- base16 theme
-- require("themes.mini-base16")
require("themes.base16")
