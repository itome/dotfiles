local eisuu = 102
local kana = 104

local obj={}
obj.__index = obj
obj.name = 'IME'
obj.version = '0.1'

function obj:init()
  self.sendEisuu = false
  self.sendKana = false
  self.lastModifiers = {}

  local CANCEL_DELAY_SECONDS = 0.150
  self.commandOptionKeyTimer = hs.timer.delayed.new(CANCEL_DELAY_SECONDS, function()
    self.sendEisuu = false
    self.sendKana = false
  end)

  self.commandOptionTap = hs.eventtap.new({hs.eventtap.event.types.flagsChanged},
    function(event)
      local newModifiers = event:getFlags()
      if not (self.lastModifiers['alt'] == newModifiers['alt']) then
        if not self.lastModifiers['alt'] then
          self.sendKana = true
          self.commandOptionKeyTimer:start()
        else
          if self.sendKana then
            print('kana')
            hs.eventtap.keyStroke({}, kana, 0)
          end
        end
        self.lastModifiers = newModifiers
      elseif not (self.lastModifiers['cmd'] == newModifiers['cmd']) then
        if not self.lastModifiers['cmd'] then
          self.sendEisuu = true
          self.commandOptionKeyTimer:start()
        else
          print('eisuu')
          if self.sendEisuu then
            hs.eventtap.keyStroke({}, eisuu, 0)
          end
          self.commandOptionKeyTimer:stop()
        end
      end

      self.lastModifiers = newModifiers
      return false
    end
  )

  self.keyDownEventTap = hs.eventtap.new({hs.eventtap.event.types.keyDown},
    function(event)
      self.sendEisuu = false
      self.sendKana = false
      return false
    end
  )
end

function obj:start()
  self.commandOptionTap:start()
  self.keyDownEventTap:start()
end

function obj:stop()
  -- Stop monitoring keystrokes
  self.commandOptionTap:stop()
  self.keyDownEventTap:stop()

  -- Reset state
  self.commandOptionKeyTimer:stop()
  self.sendEisuu = false
  self.sendKana = false
  self.lastModifiers = {}
end

return obj
