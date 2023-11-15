local eisuu = 102
local kana = 104

local leftCmd = 55
local rightCmd = 54

local obj={}
obj.__index = obj
obj.name = 'IME'
obj.version = '0.1'

function obj:init()
  self.sendEisuu = false
  self.sendKana = false
  self.lastModifiers = {}

  local CANCEL_DELAY_SECONDS = 0.5
  self.commandOptionKeyTimer = hs.timer.delayed.new(CANCEL_DELAY_SECONDS, function()
    self.sendEisuu = false
    self.sendKana = false
  end)

  self.commandOptionTap = hs.eventtap.new({hs.eventtap.event.types.flagsChanged},
    function(event)
      local keyCode = event:getKeyCode()
      local newModifiers = event:getFlags()
      if not (self.lastModifiers['cmd'] == newModifiers['cmd']) then
        if not self.lastModifiers['cmd'] then
          if keyCode == leftCmd then
            self.sendEisuu = true
          else
            self.sendKana = true
          end
          self.commandOptionKeyTimer:start()
        else
          if self.sendEisuu then
            hs.eventtap.keyStroke({}, eisuu, 0)
          elseif self.sendKana then
            hs.eventtap.keyStroke({}, kana, 0)
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
