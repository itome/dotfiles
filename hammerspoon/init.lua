hs.loadSpoon('ControlEscape'):start()

hs.hotkey.bind({"ctrl"}, "M", function()
    hs.eventtap.keyStroke({}, 'return', 0)
end)
