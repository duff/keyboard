-- Credit for this implementation goes to @arbelt and @jasoncodes 🙇⚡️😻
--
--   https://gist.github.com/arbelt/b91e1f38a0880afb316dd5b5732759f1
--   https://github.com/jasoncodes/dotfiles/blob/ac9f3ac/hammerspoon/control_escape.lua

send_escape = false
last_mods = {}

option_key_handler = function()
  send_escape = false
end

option_key_timer = hs.timer.delayed.new(0.15, option_key_handler)

option_handler = function(evt)
  local new_mods = evt:getFlags()
  if last_mods["alt"] == new_mods["alt"] then
    return false
  end
  if not last_mods["alt"] then
    last_mods = new_mods
    send_escape = true
    option_key_timer:start()
  else
    if send_escape then
      keyUpDown({}, 'escape')
    end
    last_mods = new_mods
    option_key_timer:stop()
  end
  return false
end

option_tap = hs.eventtap.new({hs.eventtap.event.types.flagsChanged}, option_handler)
option_tap:start()

other_handler = function(evt)
  send_escape = false
  return false
end

other_tap = hs.eventtap.new({hs.eventtap.event.types.keyDown}, other_handler)
other_tap:start()