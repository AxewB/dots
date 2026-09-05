vim.pack.add({
  { src = "https://github.com/RRethy/base16-nvim" },
})

local flavours_colors = nil

ok, flavours = pcall(require, "themes.flavours")
if ok then
  flavours_colors = flavours
end

local colors = flavours_colors
  or {
    base00 = "#1e1e2e",
    base01 = "#181825",
    base02 = "#313244",
    base03 = "#45475a",
    base04 = "#585b70",
    base05 = "#cdd6f4",
    base06 = "#f5e0dc",
    base07 = "#b4befe",
    base08 = "#f38ba8",
    base09 = "#fab387",
    base0A = "#f9e2af",
    base0B = "#a6e3a1",
    base0C = "#94e2d5",
    base0D = "#89b4fa",
    base0E = "#cba6f7",
    base0F = "#f2cdcd",
  }

require("base16-colorscheme").setup({
  base00 = colors.base00,
  base01 = colors.base01,
  base02 = colors.base02,
  base03 = colors.base03,
  base04 = colors.base04,
  base05 = colors.base05,
  base06 = colors.base06,
  base07 = colors.base07,
  base08 = colors.base08,
  base09 = colors.base09,
  base0A = colors.base0A,
  base0B = colors.base0B,
  base0C = colors.base0C,
  base0D = colors.base0D,
  base0E = colors.base0E,
  base0F = colors.base0F,
})
