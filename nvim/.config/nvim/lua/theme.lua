vim.pack.add({
  { src = "https://github.com/RRethy/base16-nvim" },
})

local theme_path =
  vim.fs.normalize(vim.fs.joinpath(vim.fn.stdpath("data"), "theme.lua"))
local flavours_colors

local ok, clrs = pcall(dofile, theme_path)
if ok then
  flavours_colors = clrs
else
  vim.api.nvim_echo({
    {
      "There is no theme in " .. theme_path .. ". Using predefined one",
      "WarningMsg",
    },
  }, true)
end

local colors = flavours_colors
  or {
    base00 = "#262427",
    base01 = "#3b393c",
    base02 = "#514f52",
    base03 = "#676567",
    base04 = "#7c7b7d",
    base05 = "#fcfcfc",
    base06 = "#eae9eb",
    base07 = "#fcfcfc",
    base08 = "#ff7272",
    base09 = "#fc9d6f",
    base0A = "#ffca58",
    base0B = "#bcdf59",
    base0C = "#aee8f4",
    base0D = "#49cae4",
    base0E = "#a093e2",
    base0F = "#ff8787",
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
