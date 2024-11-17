local L = {}

local onScreenTouches = {}

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

L.getTouches = function()
    return onScreenTouches
end

L.clearTouches = function()
    onScreenTouches = {}
end

Runtime:addEventListener("touch", onTouch)

return L
