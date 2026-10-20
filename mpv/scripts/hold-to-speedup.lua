-- https://github.com/iiiGerardoiii/mpv-hold-to-speedup/
-- This script changes playback speed to 2x while the spacebar or LMB is held for 0.5 seconds
-- and reverts it to normal speed when the spacebar is released. If released earlier,
-- it toggles pause/play as default behavior.
--
---------- P.S. My modifications:
----------        1. changed key bindings
----------        2. added slow mode
----------        3. changed OSD messages
----------        4. zeroed hold_threshold

local speed_multiplier = 2.5
local slow_multiplier = 0.3
local hold_threshold = 0
local is_changing = false
local timer = nil
local pre_hold_speed = 1.0 -- Variable to store your original speed

local function fast_on()
    is_changing = true
    -- Capture the speed EXACTLY as it is before we change it
    pre_hold_speed = mp.get_property_number("speed")

    mp.set_property("speed", speed_multiplier)
    mp.set_osd_ass(0, 0, "▶▶ " .. speed_multiplier .. "x faster")
end

local function slow_on()
    is_changing = true
    -- Capture the speed EXACTLY as it is before we change it
    pre_hold_speed = mp.get_property_number("speed")

    mp.set_property("speed", slow_multiplier)
    mp.set_osd_ass(0, 0, "        " .. slow_multiplier .. "x slower ◀◀")
end

local function normal_speed()
    -- Revert to the captured speed instead of a hardcoded 1.0
    mp.set_property("speed", pre_hold_speed)
    -- Clear persistent ASS text
    mp.set_osd_ass(0, 0, "")
    -- Force OSD to refresh/clear
    is_changing = false
    mp.osd_message("", 0)
end

local function handle_fast(event)
    if event.event == "down" then
        timer = mp.add_timeout(hold_threshold, fast_on)
    elseif event.event == "up" then
        if timer then timer:kill(); timer = nil end
        if is_changing then normal_speed() else mp.command("cycle pause") end
    end
end

local function handle_slow(event)
    if event.event == "down" then
        timer = mp.add_timeout(hold_threshold, slow_on)
    elseif event.event == "up" then
        if timer then timer:kill(); timer = nil end
        if is_changing then normal_speed() end
    end
end

mp.add_forced_key_binding("enter", "speed_space", handle_fast, {complex = true})
mp.add_forced_key_binding("~", "speed_click", handle_slow, {complex = true})
