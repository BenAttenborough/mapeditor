Debug = Class{}

function Debug:init()
end

function Debug:render()
    x,y = push:toGame(love.mouse.getX(),love.mouse.getY())
    love.graphics.print("Mouse: " .. x .. " " .. y, 10, 10)
end
