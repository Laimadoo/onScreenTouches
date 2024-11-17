local ost = require("onScreenTouches")
system.activate("multitouch")

local centerX = display.contentCenterX
local centerY = display.contentCenterY

local obj = display.newText("", centerX, centerY)

Runtime:addEventListener("touch", function()
    local touches = ost.getTouches()

    if #touches ~= 2 then
        obj.text = ""
        return
    end

    local sx1, sy1 = touches[1].xStart, touches[1].yStart
    local sx2, sy2 = touches[2].xStart, touches[2].yStart
    local startDist = math.sqrt((sx1 - sx2)^2 + (sy1 - sy2)^2)

    local x1, y1 = touches[1].x, touches[1].y
    local x2, y2 = touches[2].x, touches[2].y
    local dist = math.sqrt((x1 - x2)^2 + (y1 - y2)^2)

    local deltaDist = dist - startDist

    local text = "startDist: " .. startDist .. "\n"
    text = text .. "dist: " .. dist .. "\n"
    text = text .. "deltaDist: " .. deltaDist

    obj.text = text
end)
