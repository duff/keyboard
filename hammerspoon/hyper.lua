-- Keybindings for launching apps using the Hyper key
hyperModeAppMappings = {
  { 'a', '1Password 6' },
  { 'c', 'Google Chrome' },
  { 'u', 'iTunes' },
  { 'v', '/usr/local/opt/macvim/MacVim.app' },
  { 'e', 'Mail' },
  { 'm', 'Messages' },
  { 'n', 'NetNewsWire' },
  { 'f', 'Path Finder' },
  { 's', 'Safari' },
  { 'p', 'Slack' },
  { 'o', 'Spotify' },
  { 't', 'iTerm' },
  { 'h', 'Things' }
}

for i, mapping in ipairs(hyperModeAppMappings) do
  hs.hotkey.bind({"cmd","ctrl","alt","shift", }, mapping[1], function()
    hs.application.launchOrFocus(mapping[2])
  end)
end

hs.hotkey.bind({"cmd","ctrl","alt","shift", }, 'g', nil, function()
  hs.eventtap.keyStroke({'alt'}, 'space')
  hs.timer.usleep(20000)
  hs.eventtap.keyStrokes('d ')
end)


