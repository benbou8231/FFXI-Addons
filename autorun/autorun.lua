_addon.name = 'autorun'
_addon.author = 'Benbou'
_addon.version = '1.2'
_addon.commands = {'autorun','ar'}

local running = false

local function press_forward()
    if not running then
        windower.send_command('setkey numpad8 down')
        running = true
        windower.add_to_chat(207, '[autorun] ON')
    end
end

local function release_forward()
    if running then
        windower.send_command('setkey numpad8 up')
        running = false
        windower.add_to_chat(207, '[autorun] OFF')
    end
end

local function toggle()
    if running then
        release_forward()
    else
        press_forward()
    end
end

windower.register_event('addon command', function(cmd)
    cmd = cmd and cmd:lower()

    if cmd == 'on' then
        press_forward()
    elseif cmd == 'off' then
        release_forward()
    else
        toggle()
    end
end)

windower.register_event('unload', function()
    release_forward()
end)
