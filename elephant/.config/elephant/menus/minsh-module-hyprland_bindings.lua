Name = "minsh-module-hyprland_bindings"
NamePretty = "Bindings"
Icon = "network-vpn"
Description = "Show hyprland bindings"
Cache = true
Action = "%VALUE%"
SearchName = true
HideFromProviderlist = false

HYPR_CONF = os.getenv('HOME') .. '/.config/hypr'

local function split_string(inputstr, sep)
  if sep == nil then
    sep = '%s'
  end
  local t = {}
  for str in string.gmatch(inputstr, '([^' .. sep .. ']+)') do
    table.insert(t, str)
  end
  return t
end

local function cmd_to_table(command)
  local handler = io.popen(command)
  if not handler then
    return {}
  end

  local result = {}
  for line in handler:lines() do
    table.insert(result, line)
  end

  handler:close()
  return result
end

local function clear_bind(bind)
  -- Separating rest by ","
  local parts = split_string(bind, ',')

  local combination = ''
  local description = parts[3]
  local command = ''

  if parts[1] ~= ' ' then
    combination = table.concat(parts, ' +', 1, 2)
  else
    combination = parts[2]
  end

  if #parts > 3 then
    command = table.concat(parts, ' ', 4) -- с 4-го элемента
  end

  local result = { comb = combination, desc = description, cmd = command }

  -- print(table.concat(result, ' | ')) -- Результат: SUPER | M | Launch minsh menu | exec elephant m minsh-main-menu
  return result
end

function GetEntries()
  -- fetching non commented bindings and taking only right part
  local fetched_binds =
    cmd_to_table("rg '^(#)*bind' " .. HYPR_CONF .. " | cut -d'=' -f2")

  local binds = {}
  for _, bind in ipairs(fetched_binds) do
    local cleared_bind = clear_bind(bind)
    table.insert(binds, cleared_bind)
  end

  local entries = {}

  for _, bind in ipairs(binds) do
    table.insert(entries, {
      Text = bind.comb .. bind.desc,
      Subtext = bind.cmd,
      Value = "hyprctl dispatch" .. bind.cmd
    })
  end

  return entries
end
