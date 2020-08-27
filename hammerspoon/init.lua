hs.loadSpoon('ControlEscape'):start()
hs.loadSpoon('IME'):start()

hs.hotkey.bind({"ctrl"}, "M",
  function() hs.eventtap.keyStroke({}, 'return', 0) end,
  nil,
  function() hs.eventtap.keyStroke({}, 'return', 0) end
)
