local home = os.getenv("HOME")
local theme_path = home .. "/.local/share/hypr/colors.lua"

local flavours_colors

local ok, clrs = pcall(dofile, theme_path)
if ok then
  flavours_colors = clrs
else
  hl.dsp.exec_cmd(
    "notify-send 'Can't load dynamic colors file' 'Ensure that file with path '"
      .. theme_path
      .. " exists (use `flavours apply <theme_name> to generate`). Now using default colors configuration.'"
  )
end

M = flavours_colors
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

return M
