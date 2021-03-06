require "hyper"
require "spectacle"

local hints = require "hs.hints"
local fnutils = require "hs.fnutils"
local appfinder = require "hs.appfinder"
local window = require "hs.window"

-----------------------------------------------
-- Reload config on write
-----------------------------------------------
local function reload_config()
  hs.reload()
end

hyper:bind({}, "r", function()
  reload_config()
  hyper.triggered = true
end)

--- A closure function
function open(name)
  return function()
      hs.application.launchOrFocus(name)
      if name == 'Finder' then
          hs.appfinder.appFromName(name):activate()
      end
  end
end


hyper:bind({}, "H", open("Hyper"))


hyper:bind({}, "e", function() hints.windowHints(nil) end)

hyper:bind({}, "c", function() hs.hid.capslock.toggle() end)


hs.pathwatcher.new(os.getenv("HOME") .. "/.hammerspoon/", reload_config):start()
hs.alert.show("Config loaded")