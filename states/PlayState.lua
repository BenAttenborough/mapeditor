PlayState = Class{__includes = BaseState}

require 'objects.playfield'

function PlayState:init()
    playfield = Playfield()
end

function PlayState:update(dt)
    if love.mouse.isDown(1) then
        -- print ("LMB down x: " .. love.mouse.getX() .. " y: " .. love.mouse.getY())
        playfield:detectClick(love.mouse.getX(), love.mouse.getY())
    end
end

function PlayState:render()
    playfield:render()
end

function PlayState:exit() end
