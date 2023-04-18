-- Keybindings for launching apps using the Hyper key
hyperModeAppMappings = {
  { 'a', '1Password 7' },
  { 's', 'Google Chrome' },
  { 'u', 'iTunes' },
  { 'e', 'HEY' },
  { 'm', 'Messages' },
  { 'n', 'NetNewsWire' },
  { 'f', 'Path Finder' },
  { 'c', 'Safari' },
  { 'p', 'Slack' },
  { 'o', 'Spotify' },
  { 't', 'iTerm' },
  { 'x', 'xCode' },
  { '1', '2Do' }
}

for i, mapping in ipairs(hyperModeAppMappings) do
  hs.hotkey.bind({"cmd","ctrl","alt","shift", }, mapping[1], function()
    hs.application.launchOrFocus(mapping[2])
  end)
end

hs.hotkey.bind({"cmd","ctrl","alt","shift"}, 'g', nil, function()
  hs.eventtap.keyStroke({'alt'}, 'space')
  hs.timer.usleep(20000)
  hs.eventtap.keyStrokes('d ')
end)


hs.hotkey.bind({"ctrl"}, '=', nil, function()
  local device = hs.audiodevice.defaultOutputDevice()
  local targetVolume = math.min(device:volume() - 5, 100)
  device:setMuted(false)
  device:setVolume(targetVolume)
end)

hs.hotkey.bind({"ctrl","shift"}, '=', nil, function()
  local device = hs.audiodevice.defaultOutputDevice()
  local targetVolume = math.max(device:volume() + 5, 0)
  device:setMuted(false)
  device:setVolume(targetVolume)
end)

hs.hotkey.bind({"ctrl","alt","shift"}, 'space', nil, function()
  hs.spotify.playpause()
end)

hs.hotkey.bind({"ctrl","alt","shift"}, 'left', nil, function()
  hs.spotify.previous()
end)

hs.hotkey.bind({"ctrl","alt","shift"}, 'right', nil, function()
  hs.spotify.next()
end)

hs.hotkey.bind({"ctrl","shift"}, 'space', nil, function()
  hs.itunes.playpause()
end)

hs.hotkey.bind({"ctrl","shift"}, 'left', nil, function()
  hs.itunes.previous()
end)

hs.hotkey.bind({"ctrl","shift"}, 'right', nil, function()
  hs.itunes.next()
end)

