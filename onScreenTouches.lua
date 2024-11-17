local L = {}

local onScreenTouches = {}

local screen = display.newRect(0, 0, 9999, 9999)
screen.alpha = 1/255

local function onTouch(ev)
    local id = tonumber(tostring(ev.id):gsub("userdata:", ""), 16)

    local ostid
    local numTouch = #onScreenTouches + 1
    for i = 1, numTouch - 1 do
        if onScreenTouches[i].numID == id then
            ostid = onScreenTouches[i]
            numTouch = i
            break
        end
    end

    if ostid then
        if ev.phase == "ended" then
            table.remove(onScreenTouches, numTouch)
            return
        end

        ostid.numID = id
        for k, v in pairs(ev) do
            ostid[k] = v
        end
    else
        onScreenTouches[numTouch] = {}
        local ostid = onScreenTouches[numTouch]
        ostid.numID = id
        for k, v in pairs(ev) do
            ostid[k] = v
        end
    end
end

local toFront = function()
	screen:toFront()
end

screen:addEventListener("touch", onTouch)

Runtime:addEventListener("enterFrame", toFront)

L.getTouches = function()
    return onScreenTouches
end

L.clearTouches = function()
    onScreenTouches = {}
end

L.delete = function()
    screen:removeEventListener("touch", onTouch)
	Runtime:removeEventListener("enterFrame", toFront)
end

return L
