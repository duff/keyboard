-- Keybindings for launching apps using the Hyper key
hyperModeAppMappings = {
  { 'a', '1Password 6' },
  { 'c', 'Google Chrome' },
  { 'x', '/usr/local/Cellar/emacs/25.1/Emacs.app' },
  { 'u', 'iTunes' },
  { 'v', 'MacVim' },
  { 'e', 'Mail' },
  { 'm', 'Messages' },
  { 'n', 'NetNewsWire' },
  { 'f', 'Path Finder' },
  { 's', 'Safari' },
  { 'p', 'Slack' },
  { 'o', 'Spotify' },
  { 't', 'iTerm' },
  { 'h', 'Things' },
  { 'w', 'Tweetbot' }
}

for i, mapping in ipairs(hyperModeAppMappings) do
  hs.hotkey.bind({"cmd","ctrl","alt","shift", }, mapping[1], function()
    hs.application.launchOrFocus(mapping[2])
  end)

end
