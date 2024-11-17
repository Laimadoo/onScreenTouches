local ost = require("onScreenTouches")
system.activate("multitouch")

local centerX = display.contentCenterX
local centerY = display.contentCenterY

local obj = display.newText("", centerX, centerY)

Runtime:addEventListener("touch", function()
    local touching = ost.getTouching()

    if #touching ~= 2 then
        obj.text = ""
        return
    end

    local sx1, sy1 = touching[1].xStart, touching[1].yStart
    local sx2, sy2 = touching[2].xStart, touching[2].yStart
    local startDist = math.sqrt((sx1 - sx2)^2 + (sy1 - sy2)^2)

    local x1, y1 = touching[1].x, touching[1].y
    local x2, y2 = touching[2].x, touching[2].y
    local dist = math.sqrt((x1 - x2)^2 + (y1 - y2)^2)

    local deltaDist = dist - startDist

    local text = "startDist: " .. startDist .. "\n"
    text = text .. "dist: " .. dist .. "\n"
    text = text .. "deltaDist: " .. deltaDist

    obj.text = text
end)