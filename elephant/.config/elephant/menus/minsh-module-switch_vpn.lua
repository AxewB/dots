Name = "minsh-module-switch_vpn"
NamePretty = "VPN connections"
Icon = "network-vpn"
Description = "VPN control via nmcli"
Cache = false
SearchName = true
HideFromProviderlist = false

-- VPN объект прямо внутри меню
local vpn = {}

function vpn.get_set(tbl)
  local set = {}
  for i = 1, #tbl do set[tbl[i]] = true end
  return set
end

function vpn.cmd(cmd)
  local h = io.popen(cmd)
  if not h then return {} end
  local res = {}
  for line in h:lines() do table.insert(res, line) end
  h:close()
  return res
end

function vpn.get_active()
  return vpn.cmd("nmcli -t -f NAME,TYPE connection show --active | grep vpn | cut -d ':' -f1")
end

function vpn.get_inactive(active_vpn)
  local all = vpn.cmd("nmcli -t -f NAME,TYPE connection show | grep vpn | cut -d ':' -f1")
  local lookup = vpn.get_set(active_vpn)
  local res = {}
  for i = 1, #all do
    if not lookup[all[i]] then table.insert(res, all[i]) end
  end
  return res
end

function vpn.disconnect(name)
  local ok = os.execute("nmcli connection down '" .. name .. "'")
  local msg = ok and "Disconnected from %s" or "Error while disconnecting from %s"
  os.execute(string.format('notify-send --urgency=low "VPN" "' .. msg .. '"', name))
end

function vpn.connect(name)
  local ok = os.execute("nmcli connection up '" .. name .. "'")
  local msg = ok and "Connected to %s" or "Error while connecting to %s"
  os.execute(string.format('notify-send --urgency=low "VPN" "' .. msg .. '"', name))
end

function vpn.init()
  vpn.active = vpn.get_active()
  vpn.inactive = vpn.get_inactive(vpn.active)
end

vpn.init()

-- Функция переключения VPN
function SwitchVPN(value)
  local active_set = vpn.get_set(vpn.active)

  if active_set[value] then
    vpn.disconnect(value)
    return
  end

  for _, v in ipairs(vpn.active) do
    vpn.disconnect(v)
  end

  vpn.connect(value)
  vpn.init()  -- обновляем списки после переключения
end

-- Формируем список для меню Elephant
function GetEntries()
  local entries = {}

  for _, v in ipairs(vpn.active) do
    table.insert(entries, {
      Text = "  " .. v,
      Subtext = "Active  disconnect",
      Value = v,
      Actions = { default = "lua:SwitchVPN" },
    })
  end

  for _, v in ipairs(vpn.inactive) do
    table.insert(entries, {
      Text = v,
      Subtext = "Inactive  connect",
      Value = v,
      Actions = { default = "lua:SwitchVPN" },
    })
  end

  return entries
end
