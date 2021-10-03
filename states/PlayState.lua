PlayState = Class{__includes = BaseState}

require 'objects.playfield'
require 'objects.ui'
require 'objects.debug'

function PlayState:init()
    playfield = Playfield("ISO")
    ui = UI()
    debug = Debug()
    selectedTile = 2
end

function PlayState:update(dt)
    if love.mouse.isDown(1) then
        playfield:detectClick(love.mouse.getX(), love.mouse.getY())
        ui:detectClick(love.mouse.getX(), love.mouse.getY())
    end
    playfield:detectMousePos(love.mouse.getX(), love.mouse.getY())
end

function PlayState:render()
    playfield:renderIsometricPlayfield()
    ui:render()
    debug:render()
end

function PlayState:exit() end
