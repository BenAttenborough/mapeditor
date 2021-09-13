push = require 'libs.push'
Class = require 'libs.class'
-- Timer = require 'libs.timer'
-- M = require('libs.Moses.moses')

require 'StateMachine'
require 'states.BaseState'
require 'states.PlayState'
require 'configs.global'

function love.update(dt)
    gStateMachine:update(dt)
end

function love.load()
    love.graphics.setDefaultFilter('nearest', 'nearest')
    love.window.setTitle('My game')
    
    push:setupScreen(VIRTUAL_WIDTH, VIRTUAL_HEIGHT, WINDOW_WIDTH, WINDOW_HEIGHT, {
        fullscreen = false,
        resizable = true,
        vsync = true
    })

    
    gStateMachine = StateMachine {
        ['play'] = function() return PlayState() end,
    }
    gStateMachine:change('play', {})
end

function love.draw()
    push:apply('start')
    gStateMachine:render()
    push:apply('end')
end
