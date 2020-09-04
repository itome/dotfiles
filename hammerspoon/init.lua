hs.loadSpoon('ControlEscape'):start()
hs.loadSpoon('IME'):start()

hs.hotkey.bind({"ctrl"}, "M",
  function() hs.eventtap.keyStroke({}, 'return', 0) end,
  nil,
  function() hs.eventtap.keyStroke({}, 'return', 0) end
)

hs.hotkey.bind({"ctrl"}, "P",
  function() hs.eventtap.keyStroke({}, 'up', 0) end,
  nil,
  function() hs.eventtap.keyStroke({}, 'up', 0) end
)

hs.hotkey.bind({"ctrl"}, "N",
  function() hs.eventtap.keyStroke({}, 'down', 0) end,
  nil,
  function() hs.eventtap.keyStroke({}, 'down', 0) end
)

hs.hotkey.bind({"ctrl"}, "I",
  function() hs.eventtap.keyStroke({}, 'tab', 0) end,
  nil,
  function() hs.eventtap.keyStroke({}, 'tab', 0) end
)