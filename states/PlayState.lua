PlayState = Class{__includes = BaseState}

require 'objects.playfield'
require 'objects.ui'

function PlayState:init()
    playfield = Playfield()
    ui = UI()
    selectedTile = 2
end

function PlayState:update(dt)
    if love.mouse.isDown(1) then
        -- print ("LMB down x: " .. love.mouse.getX() .. " y: " .. love.mouse.getY())
        playfield:detectClick(love.mouse.getX(), love.mouse.getY())
        ui:detectClick(love.mouse.getX(), love.mouse.getY())
    end
    -- print(selectedTile)
end

function PlayState:render()
    playfield:render()
    ui:render()
end

function PlayState:exit() end
